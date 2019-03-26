library(gplm)


### Name: bandwidth.scott
### Title: Scott's rule of thumb
### Aliases: bandwidth.scott
### Keywords: smooth

### ** Examples

  ## two-dimensional data
  n <- 1000
  u <- runif(n)
  thresh <- 0.4
  x1 <- rnorm(n)*(u<thresh) +rnorm(n,mean=3)*(u>=thresh)
  x2 <- rnorm(n)*(u<thresh) +rnorm(n,mean=9)*(u>=thresh)
  bandwidth.scott( cbind(x1,x2) )



