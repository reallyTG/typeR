library(spatstat)


### Name: summary.distfun
### Title: Summarizing a Function of Spatial Location
### Aliases: summary.distfun summary.funxy
### Keywords: spatial methods

### ** Examples

   f <- function(x,y) { x^2 + y^2 - 1} 
   g <- funxy(f, square(2))
   summary(g)

   summary(distfun(cells))
   summary(distfun(cells), dimyx=256)



