library(spatstat)


### Name: Replace.linim
### Title: Reset Values in Subset of Image on Linear Network
### Aliases: [<-.linim
### Keywords: spatial manip

### ** Examples

  # make a function
  Y <- as.linim(distfun(runiflpp(5, simplenet)))
  # replace some values
  B <- square(c(0.25, 0.55))
  Y[B] <- 2
  plot(Y, main="")
  plot(B, add=TRUE, lty=3)
  X <- runiflpp(4, simplenet)
  Y[X] <- 5



