library(spatstat)


### Name: clusterfield
### Title: Field of clusters
### Aliases: clusterfield clusterfield.character clusterfield.function
###   clusterfield.kppm
### Keywords: spatial

### ** Examples

  # method for fitted model
  fit <- kppm(redwood~1, "Thomas")
  clusterfield(fit, eps = 0.01)

  # method for functions
  kernel <- function(x,y,scal) { 
      r <- sqrt(x^2 + y^2)
      ifelse(r > 0,
             dgamma(r, shape=5, scale=scal)/(2 * pi * r),
             0)               
  }
  X <- runifpoint(10)
  clusterfield(kernel, X, scal=0.05)



