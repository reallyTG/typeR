library(spatstat)


### Name: as.function.fv
### Title: Convert Function Value Table to Function
### Aliases: as.function.fv as.function.rhohat
### Keywords: spatial methods

### ** Examples

  K <- Kest(cells)
  f <- as.function(K)
  f
  f(0.1)
  g <- as.function(K, value=c("iso", "trans"))
  g
  g(0.1, "trans")



