library(mazealls)


### Name: iso_trapezoid_maze
### Title: iso_trapezoid_maze .
### Aliases: iso_trapezoid_maze
### Keywords: plotting

### ** Examples


library(TurtleGraphics)
turtle_init(1000,1000)
turtle_hide() 
iso_trapezoid_maze(depth=4,20,clockwise=FALSE,draw_boundary=TRUE)

turtle_init(1000,1000)
turtle_hide() 
turtle_do({
iso_trapezoid_maze(depth=3,20,clockwise=TRUE,draw_boundary=TRUE,boundary_holes=3)
})

turtle_init(2000,2000)
turtle_hide() 
turtle_up()
turtle_do({
	len <- 22
	iso_trapezoid_maze(depth=log2(len),15,clockwise=TRUE,draw_boundary=TRUE,
	  boundary_holes=c(1,3),method='one_ear',
	  boundary_hole_color=c('clear','clear','green','clear'))
	iso_trapezoid_maze(depth=log2(len),15,clockwise=FALSE,draw_boundary=TRUE,
	  boundary_lines=c(2,3,4),boundary_holes=c(2),method='one_ear',
	  boundary_hole_color=c('red'))
})



