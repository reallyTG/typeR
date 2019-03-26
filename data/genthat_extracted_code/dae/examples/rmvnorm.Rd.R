library(dae)


### Name: rmvnorm
### Title: generates a vector of random values from a multivariate normal
###   distribution
### Aliases: rmvnorm
### Keywords: datagen

### ** Examples

## set up a two-level factor and a three-level factor, both of length 12
A <- factor(rep(1:2, each=6))
B <- factor(rep(1:3, each=2, times=2))

## generate random values from a multivariate normal for which 
#the mean is 20 for all variables and 
#the variance matrix has random effects for factor A, ar1 pattern for B and 
#residual random variation
mean <- rep(20, 12)
V <- fac.vcmat(A, 5) + fac.ar1mat(B, 0.6) + 2*mat.I(12)
y <- rmvnorm(mean, V)



