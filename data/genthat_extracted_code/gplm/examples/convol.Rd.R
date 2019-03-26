library(gplm)


### Name: convol
### Title: Kernel convolution
### Aliases: convol
### Keywords: smooth

### ** Examples

  n <- 100
  x <- rnorm(n)
  convol(x,h=0.8,grid=-3:3)/n  ## estimates density of x at points -3:3



