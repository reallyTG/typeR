library(RKUM)


### Name: ifmkcca
### Title: Influence Function of Multiple Kernel Canonical Analysis
### Aliases: ifmkcca

### ** Examples


##Dummy data:

X <- matrix(rnorm(500),100); Y <- matrix(rnorm(500),100); Z <- matrix(rnorm(500),100)

ifmkcca(X,Y, Z, "rbfdot",  1e-05,  2, 1)



