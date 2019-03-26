library(mazealls)


### Name: parallelogram_maze
### Title: parallelogram_maze .
### Aliases: parallelogram_maze
### Keywords: plotting

### ** Examples


library(TurtleGraphics)

turtle_init(500,300,mode='clip')
turtle_hide()
turtle_up()
turtle_do({
 turtle_setpos(15,15)
 turtle_setangle(0)
 parallelogram_maze(angle=90,unit_len=10,width=45,height=25,method='uniform',
 	start_from='corner',draw_boundary=TRUE)
})

# testing imbalance condition
turtle_init(400,500,mode='clip')
turtle_hide()
turtle_up()
turtle_do({
 turtle_setpos(15,250)
 turtle_setangle(0)
 parallelogram_maze(angle=90,unit_len=10,width=30,height=40,
   method='two_parallelograms',draw_boundary=TRUE,balance=-1.0)
})

# a bunch of imbalanced mazes, fading into each other
turtle_init(850,400,mode='clip')
turtle_hide()
turtle_up()
turtle_do({
  turtle_setpos(15,200)
  turtle_setangle(0)
  valseq <- seq(from=-1.5,to=1.5,length.out=4)
  blines <- c(1,2,3,4)
  bholes <- c(1,3)
  set.seed(12354)
  for (iii in seq_along(valseq)) {
     parallelogram_maze(angle=90,unit_len=10,width=20,height=25,
      method='two_parallelograms',draw_boundary=TRUE,balance=valseq[iii],
       end_side=3,boundary_lines=blines,boundary_holes=bholes)
     turtle_right(180)
     blines <- c(2,3,4)
     bholes <- c(3)
  }
})

# a somewhat 'boustrophedonic' maze
turtle_init(500,300,mode='clip')
turtle_hide()
turtle_up()
turtle_do({
 turtle_setpos(15,15)
 turtle_setangle(0)
 parallelogram_maze(angle=90,unit_len=10,width=47,height=27,
    method='two_parallelograms', height_boustro=c(21,3),width_boustro=c(21,3),balance=-0.25,
		 start_from='corner',draw_boundary=TRUE)
})



