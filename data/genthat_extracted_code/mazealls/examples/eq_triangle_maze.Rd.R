library(mazealls)


### Name: eq_triangle_maze
### Title: eq_triangle_maze .
### Aliases: eq_triangle_maze
### Keywords: plotting

### ** Examples

library(TurtleGraphics)
turtle_init(2500,2500)
turtle_hide() 
turtle_up()
turtle_do({
  turtle_left(90)
  turtle_forward(40)
  turtle_right(90)
  eq_triangle_maze(depth=3,12,clockwise=FALSE,method='two_ears',draw_boundary=TRUE)
})

turtle_init(2500,2500)
turtle_hide() 
turtle_up()
turtle_do({
  turtle_left(90)
  turtle_forward(40)
  turtle_right(90)
  eq_triangle_maze(depth=3,12,clockwise=FALSE,method='random',draw_boundary=TRUE)
})

# join two together, with green holes on opposite sides
turtle_init(2500,2500)
turtle_hide() 
turtle_up()
turtle_do({
  turtle_left(90)
  turtle_forward(40)
  turtle_right(90)
  eq_triangle_maze(depth=3,12,clockwise=TRUE,method='two_ears',draw_boundary=TRUE,
    boundary_holes=c(1,3),boundary_hole_color=c('clear','clear','green'))
  eq_triangle_maze(depth=3,12,clockwise=FALSE,method='uniform',draw_boundary=TRUE,
    boundary_lines=c(2,3),boundary_holes=c(2),boundary_hole_color='green')
})

# non integral depths also possible:
turtle_init(2500,2500)
turtle_hide() 
turtle_up()
turtle_do({
  turtle_left(90)
  turtle_forward(40)
  turtle_right(90)
  eq_triangle_maze(depth=log2(27),12,clockwise=TRUE,method='hex_and_three',draw_boundary=TRUE,
    boundary_holes=c(1,3),boundary_hole_color=c('clear','clear','green'))
  eq_triangle_maze(depth=log2(27),12,clockwise=FALSE,method='shave',draw_boundary=TRUE,
    boundary_lines=c(2,3),boundary_holes=c(2),boundary_hole_color='green')
})



