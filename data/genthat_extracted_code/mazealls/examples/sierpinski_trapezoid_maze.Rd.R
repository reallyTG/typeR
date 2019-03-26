library(mazealls)


### Name: sierpinski_trapezoid_maze
### Title: sierpinski_trapezoid_maze .
### Aliases: sierpinski_trapezoid_maze
### Keywords: plotting

### ** Examples


require(TurtleGraphics)
turtle_init(1000,1000,mode='clip')
turtle_hide()
turtle_up()
turtle_do({
  turtle_setpos(500,500)
  turtle_setangle(0)
  sierpinski_trapezoid_maze(unit_len=15,depth=4,color1='black',color2='green',
    clockwise=TRUE,draw_boundary=TRUE,boundary_holes=c(1,3))
  sierpinski_trapezoid_maze(unit_len=15,depth=4,color1='black',color2='green',
    clockwise=FALSE,draw_boundary=TRUE,
    boundary_lines=c(2,3,4),boundary_holes=3)
})

# stack some trapezoids!
require(TurtleGraphics)
turtle_init(750,900,mode='clip')
turtle_hide()
turtle_up()
turtle_do({
  turtle_setpos(25,450)
  turtle_setangle(0)
  blines <- c(1,2,4)
  for (dep in seq(from=4,to=0)) {
    sierpinski_trapezoid_maze(unit_len=13,depth=dep,color1='black',color2='green',
      flip_color_parts=2,
      clockwise=TRUE,boundary_lines=blines,draw_boundary=TRUE,boundary_holes=c(1,3),
      end_side=3)
    turtle_right(180)
    blines <- c(1,2,4)
  }
})
## Not run: 
##D require(TurtleGraphics)
##D turtle_init(750,900,mode='clip')
##D turtle_hide()
##D turtle_up()
##D turtle_do({
##D   turtle_setpos(25,450)
##D   turtle_setangle(0)
##D   blines <- c(1,2,4)
##D   for (dep in seq(from=5,to=0)) {
##D     sierpinski_trapezoid_maze(unit_len=13,depth=dep,color1='black',color2='green',
##D       flip_color_parts=3,
##D       clockwise=TRUE,boundary_lines=blines,draw_boundary=TRUE,boundary_holes=c(1,3),
##D       end_side=3)
##D     turtle_right(180)
##D     blines <- c(1,2,4)
##D   }
##D })
## End(Not run)




