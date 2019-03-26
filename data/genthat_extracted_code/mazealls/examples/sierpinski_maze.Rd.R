library(mazealls)


### Name: sierpinski_maze
### Title: sierpinski_maze .
### Aliases: sierpinski_maze
### Keywords: plotting

### ** Examples

library(TurtleGraphics)
turtle_init(1000,1000,mode='clip')
turtle_up()
turtle_hide()
turtle_do({
	turtle_setpos(10,500)
	turtle_setangle(0)
	sierpinski_maze(depth=5,unit_len=19,boundary_lines=TRUE,
	  boundary_holes=c(1,3),color1='black',color2='gray60')
})




