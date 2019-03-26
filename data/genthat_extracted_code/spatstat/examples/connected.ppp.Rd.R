library(spatstat)


### Name: connected.ppp
### Title: Connected Components of a Point Pattern
### Aliases: connected.ppp connected.pp3
### Keywords: spatial math

### ** Examples

   Y <- connected(redwoodfull, 0.1)
   if(interactive()) {
    plot(Y, cols=1:length(levels(marks(Y))),
         main="connected(redwoodfull, 0.1)")
   }
   X <- osteo$pts[[1]]
   Z <- connected(X, 32)
   if(interactive()) {
    plot(Z, col=marks(Z), main="")
   }



