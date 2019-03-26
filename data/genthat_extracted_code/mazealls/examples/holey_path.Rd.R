library(mazealls)


### Name: holey_path
### Title: holey_path .
### Aliases: holey_path
### Keywords: plotting

### ** Examples


library(TurtleGraphics)
# draw a triangle with holes on the boundaries
turtle_init(1000,1000)
holey_path(unit_len=20, lengths=rep(10,3), angles=c(120), draw_line=TRUE, has_hole=TRUE)

# draw a square with holes on the boundaries
turtle_init(1000,1000)
turtle_hide()
holey_path(unit_len=20, lengths=rep(10,4), angles=c(90), draw_line=TRUE, has_hole=TRUE, 
  hole_color=c('red','green'))

# draw a square spiral
turtle_init(1000,1000)
turtle_hide()
holey_path(unit_len=20, lengths=sort(rep(1:10,2),decreasing=TRUE), angles=c(90), 
  draw_line=TRUE, has_hole=FALSE)



