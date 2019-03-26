library(spatstat)


### Name: as.linfun
### Title: Convert Data to a Function on a Linear Network
### Aliases: as.linfun as.linfun.linim as.linfun.lintess
### Keywords: spatial manip

### ** Examples

   X <- runiflpp(2, simplenet)
   Y <- runiflpp(5, simplenet)

   # image on network
   D <- density(Y, 0.1, verbose=FALSE)

   f <- as.linfun(D)
   f
   f(X)

   # tessellation on network
   Z <- lineardirichlet(Y)
   g <- as.linfun(Z)
   g(X)
   h <- as.linfun(Z, values = runif(5))
   h(X)



