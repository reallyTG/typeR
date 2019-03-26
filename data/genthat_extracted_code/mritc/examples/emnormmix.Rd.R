library(mritc)


### Name: emnormmix
### Title: Estimate the Parameters of a Normal Mixture Model Using the EM
###   Algorithm
### Aliases: emnormmix
### Keywords: utilities

### ** Examples

  prop <- c(0.3, 0.3, 0.4)
  mu <- c(-10, 0, 10)
  sigma <- rep(1, 3)
  y<- floor(rnormmix(n=100000, prop, mu, sigma)[,1])
  initial <- initOtsu(y, 2)
  emnormmix(y=y, prop=initial$prop, mu=initial$mu, sigma=initial$sigma,
            err=1e-7, maxit=100, verbose=TRUE)



