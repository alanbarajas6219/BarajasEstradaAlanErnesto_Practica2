extends Node2D
# Asigna texturas a planetas y rota las orbitas con un timer.

# Referencias a las obitas, rotamos los Node2D para simular la traslacion.
@onready var orbit1: Node2D = $Orbits/Orbit1
@onready var orbit2: Node2D = $Orbits/Orbit2
@onready var orbit3: Node2D = $Orbits/Orbit3

# Referencias a los Sprite2D dentro de cada planeta instanciado.
# Se usan para asignar una textura distinta a cada planeta sin duplicar escenas.
@onready var p1_sprite: Sprite2D = $Orbits/Orbit1/Planet1/Sprite
@onready var p2_sprite: Sprite2D = $Orbits/Orbit2/Planet2/Sprite
@onready var p3_sprite: Sprite2D = $Orbits/Orbit3/Planet3/Sprite

# Velocidad angular, se usan valores distintos para tener orbitas distintas.
var w1 := 0.03
var w2 := 0.02
var w3 := 0.01

func _ready() -> void:
	# _ready() corre cuando la escena ya cargo y los nodos existen.
	# Asignamos texturas aquí para que Planet.tscn sea una plantilla reutilizable.
	p1_sprite.texture = load("res://assets/textures/planet1.png")
	p2_sprite.texture = load("res://assets/textures/planet2.png")
	p3_sprite.texture = load("res://assets/textures/planet3.png")

func _on_orbit_timer_timeout() -> void:
	# Señal: OrbitTimer.timeout()
	# Al rotar Orbit1/2/3 centrados en el Sol, los planetas orbitan alrededor del Sol.
	orbit1.rotation += w1
	orbit2.rotation += w2
	orbit3.rotation += w3
