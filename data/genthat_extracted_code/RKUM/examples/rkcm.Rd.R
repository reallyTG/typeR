library(RKUM)


### Name: rkcm
### Title: Robsut Kernel Center Matrix
### Aliases: rkcm

### ** Examples


##Dummy data:

X <- matrix(rnorm(2000),200); Y <- matrix(rnorm(2000),200)

rkcm(X, "Huber","rbfdot")



