library(rv)


### Name: rvpois
### Title: Generate Random Vectors from a Poisson Sampling Model
### Aliases: rvpois
### Keywords: classes

### ** Examples


  x <- rvpois(lambda=10)  # A Poisson rv with mean 10
  lbd <- rvchisq(1,1)     # Some positive rv
  y <- rvpois(lambda=lbd) # Not a Poisson rv, although each simulation is a draw from Poisson.




