defmodule CollabTodoWeb.RoomChannel do
  use CollabTodoWeb, :channel

  def join("rooms:" <> _roomname, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_task", params, socket) do
    id = System.unique_integer([:positive])
    broadcast(socket, "new_task", %{text: params["text"], id: id})
    {:noreply, socket}
  end

  def handle_in("toggle_task", params, socket) do
    broadcast_from(socket, "toggle_task", %{id: params["id"]})
    {:noreply, socket}
  end
end
