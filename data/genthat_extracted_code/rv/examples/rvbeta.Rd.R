library(rv)


### Name: rvbeta
### Title: Generate Random Vectors from a Beta Sampling Model
### Aliases: rvbeta rvnbeta
### Keywords: classes

### ** Examples


   n <- 12         # sample size
   y <- (0:(n-1))  # observations
   a <- b <- 1/3   # the neutral beta prior
   rvbeta(1, shape1=a+y, shape2=b+n-y)
   rvnbeta(1, shape1=y, shape2=n-y)




