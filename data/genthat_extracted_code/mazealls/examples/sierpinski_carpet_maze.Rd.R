library(mazealls)


### Name: sierpinski_carpet_maze
### Title: sierpinski_carpet_maze .
### Aliases: sierpinski_carpet_maze
### Keywords: plotting

### ** Examples

library(TurtleGraphics)
turtle_init(800,900,mode='clip')
turtle_hide()
turtle_up()
turtle_do({
 turtle_setpos(35,400)
 turtle_setangle(0)
 sierpinski_carpet_maze(angle=80,unit_len=8,width=30,height=30,
   method='two_parallelograms',draw_boundary=TRUE,balance=-1.0,color2='green')
})

## Not run: 
##D library(TurtleGraphics)
##D turtle_init(2000,2000,mode='clip')
##D turtle_hide()
##D turtle_up()
##D bholes <- list(c(1,2), c(1), c(2))
##D turtle_do({
##D  turtle_setpos(1000,1100)
##D  turtle_setangle(180)
##D  for (iii in c(1:3)) {
##D 	 mybhol <- bholes[[iii]]
##D 	 sierpinski_carpet_maze(angle=120,unit_len=12,width=81,height=81,
##D 		 draw_boundary=TRUE,boundary_lines=c(1,2,3),num_boundary_holes=0,
##D 		 boundary_holes=mybhol,balance=1.0,color2='green',
##D 		 start_from='corner')
##D 	 turtle_left(120)
##D  }
##D })
## End(Not run)



