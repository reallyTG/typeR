library(mazealls)


### Name: holey_line
### Title: holey_line .
### Aliases: holey_line
### Keywords: plotting

### ** Examples


library(TurtleGraphics)
turtle_init(1000,1000,mode='clip')
turtle_hide()
y <- holey_line(unit_len=20, num_segs=15)

turtle_right(90)
y <- holey_line(unit_len=20, num_segs=10,hole_arrow=TRUE)




