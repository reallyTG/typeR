library(mazealls)


### Name: koch_maze
### Title: koch_maze .
### Aliases: koch_maze
### Keywords: plotting

### ** Examples


library(TurtleGraphics)
turtle_init(2000,2000)
turtle_hide() 
turtle_up()
set.seed(1234)
turtle_do({
	turtle_backward(distance=400)
	turtle_left(90)
	turtle_forward(650)
	turtle_right(90)
	turtle_right(30)
	koch_maze(depth=3,unit_len=14)
})



