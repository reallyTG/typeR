library(rdpower)


### Name: rdpower
### Title: Power Calculations for RD Designs
### Aliases: rdpower

### ** Examples

# Toy dataset
X <- array(rnorm(2000),dim=c(1000,2))
R <- X[,1] + X[,2] + rnorm(1000)
Y <- 1 + R -.5*R^2 + .3*R^3 + (R>=0) + rnorm(1000)
# Power against tau = 1
tmp <- rdpower(data=cbind(Y,R),tau=1)
# Power against tau = 1 including covariates
tmp <- rdpower(data=cbind(Y,R),tau=1,covs=X)





