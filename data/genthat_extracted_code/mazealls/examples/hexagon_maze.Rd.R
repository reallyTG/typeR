library(mazealls)


### Name: hexagon_maze
### Title: hexagon_maze .
### Aliases: hexagon_maze
### Keywords: plotting

### ** Examples

library(TurtleGraphics)
turtle_init(2000,2000)
turtle_hide()
turtle_do({
	turtle_up()
	turtle_backward(250)
	turtle_right(90)
	turtle_forward(150)
	turtle_left(90)

	turtle_right(60)
	hexagon_maze(depth=3,12,clockwise=FALSE,method='six_triangles',
	  draw_boundary=TRUE,boundary_holes=c(1,4),boundary_hole_color='green')
})


turtle_init(2000,2000)
turtle_hide()
turtle_do({
	turtle_up()
	turtle_backward(250)
	turtle_right(90)
	turtle_forward(150)
	turtle_left(90)

	turtle_right(60)
	hexagon_maze(depth=log2(20),12,clockwise=FALSE,method='six_triangles',
	  draw_boundary=TRUE,boundary_holes=c(1,4),boundary_hole_color='green')
})


turtle_init(1000,1000)
turtle_hide()
turtle_do({
	turtle_up()
	turtle_backward(250)
	turtle_right(90)
	turtle_forward(150)
	turtle_left(90)

	turtle_right(60)
	hexagon_maze(depth=3,12,clockwise=FALSE,method='three_parallelograms',
	  draw_boundary=TRUE,boundary_holes=c(1,4),boundary_hole_color='green')
})

turtle_init(1000,1000)
turtle_hide()
turtle_do({
	hexagon_maze(depth=3,15,clockwise=TRUE,method='two_trapezoids',
	  draw_boundary=TRUE,boundary_holes=c(1,4))
	hexagon_maze(depth=3,15,clockwise=FALSE,method='two_trapezoids',
	  draw_boundary=TRUE,boundary_lines=c(2,3,4,5,6),boundary_holes=c(1,4))
})

turtle_init(1000,1000)
turtle_hide()
turtle_do({
	depth <- 3
	num_segs <- 2^depth
	unit_len <- 8
	multiplier <- -1
	hexagon_maze(depth=depth,unit_len,clockwise=FALSE,method='two_trapezoids',
	  draw_boundary=FALSE)
	for (iii in c(1:6)) {
		if (iii %in% c(1,4)) {
			holes <- c(1,4) 
		} else {
			holes <- c(1)
		}
		hexagon_maze(depth=depth,unit_len,clockwise=TRUE,method='two_trapezoids',
		  draw_boundary=TRUE,boundary_holes=holes)
		turtle_forward(distance=unit_len * num_segs/2)
		turtle_right((multiplier * 60) %% 360)
		turtle_forward(distance=unit_len * num_segs/2)
	}
})



