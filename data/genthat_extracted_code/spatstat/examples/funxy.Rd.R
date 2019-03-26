library(spatstat)


### Name: funxy
### Title: Spatial Function Class
### Aliases: funxy
### Keywords: spatial math

### ** Examples

   f <- function(x,y) { x^2 + y^2 - 1} 
   g <- funxy(f, square(2))
   g(0.2, 0.3)
   g
   g(cells[1:4])



