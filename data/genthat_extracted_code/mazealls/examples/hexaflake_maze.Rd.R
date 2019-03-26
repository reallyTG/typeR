library(mazealls)


### Name: hexaflake_maze
### Title: hexaflake_maze .
### Aliases: hexaflake_maze
### Keywords: plotting

### ** Examples

library(TurtleGraphics)
turtle_init(1000,1000,mode='clip')
turtle_hide()
turtle_do({
  turtle_setpos(50,500)
  turtle_setangle(0)
  hexaflake_maze(depth=3,unit_len=10,draw_boundary=TRUE,color2='green')
})




