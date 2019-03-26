library(rv)


### Name: rvnorm
### Title: Generate Random Variables from a Gaussian (Normal) Sampling
###   Model
### Aliases: rvnorm
### Keywords: classes

### ** Examples


  x <- rvnorm(mean=1:10, sd=1:10) # A vector of length 10.
  Sigma <- diag(1:10)
  y <- rvnorm(mean=1:10, var=Sigma)




