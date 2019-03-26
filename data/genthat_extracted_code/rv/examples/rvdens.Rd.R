library(rv)


### Name: rvdens
### Title: Sample from an arbitrary density function using grid
###   approximation
### Aliases: rvdens
### Keywords: classes

### ** Examples


  x <- rvdens(FUN=stats:::dnorm, range=c(-5, 5), unitprecision=10)
  y <- rvnorm(1) ## Should be close to x




