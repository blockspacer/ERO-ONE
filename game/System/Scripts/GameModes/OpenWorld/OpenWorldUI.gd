extends CanvasLayer

onready var tab_menu = get_node("TabMenu")
onready var map = get_node("TabMenu/Hbox/Map")
# Called when the node enters the scene tree for the first time.
func _ready():
	tab_menu.hide()
	$TabMenu/Hbox.add_constant_override("separation", 0)

func _input(event):
	if event.is_action("map") and event.is_action_pressed("map") \
		and !event.is_echo():
			if tab_menu.visible:
				tab_menu.hide()
				EROOverlayedMenus.unpause_game()
				EROOverlayedMenus.show_game_ui()
			else:
				EROOverlayedMenus.pause_game()
				EROOverlayedMenus.hide_game_ui()
				#map_renderer.size = $CanvasLayer/Map/Hbox/Map.rect_size
				tab_menu.show()
				
				map.on_show()
				#map_renderer.set_origin(player.global_transform.origin)
				#map_scale_target = DEFAULT_MAP_SCALE
				#map_renderer.renderer.scale = DEFAULT_MAP_SCALE
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)