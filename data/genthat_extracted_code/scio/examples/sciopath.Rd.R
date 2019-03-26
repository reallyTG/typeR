library(scio)


### Name: sciopath
### Title: Compute the SCIO estimates for a grid of penalty values
### Aliases: sciopath
### Keywords: multivariate models graphs

### ** Examples

set.seed(100)
x <- matrix(rnorm(50*20),ncol=4)
s <- var(x)
a <- sciopath(s)



