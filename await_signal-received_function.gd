extends Node

# connected to some func
signal signal_1

func _ready() -> void:
	signal_1.connect(self._on_signal_1)

	print("signal emits")
	#signal_1.emit()
	await fake_emit(signal_1, [])
	print("signal reveiver ended")


func fake_emit(_signal, args):
	for _signal_info_dict in _signal.get_connections():
		await _signal_info_dict.callable.callv(args)


func _on_signal_1() -> void:
	print("on signal: waiting starts")
	await get_tree().create_timer(2.0).timeout
	print("on signal: waiting ended")
