library(spatstat)


### Name: pairdist.default
### Title: Pairwise distances
### Aliases: pairdist.default
### Keywords: spatial math

### ** Examples

   x <- runif(100)
   y <- runif(100)
   d <- pairdist(x, y)
   d <- pairdist(cbind(x,y))
   d <- pairdist(x, y, period=c(1,1))
   d <- pairdist(x, y, squared=TRUE)



