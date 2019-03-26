library(RKUM)


### Name: rkcco
### Title: Robust kernel cross-covariance opetator
### Aliases: rkcco

### ** Examples


##Dummy data:

X <- matrix(rnorm(2000),200); Y <- matrix(rnorm(2000),200)

rkcco(X,Y, "Huber","rbfdot", 1e-05)



