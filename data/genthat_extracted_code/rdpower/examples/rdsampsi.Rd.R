library(rdpower)


### Name: rdsampsi
### Title: Sample Size Calculations for RD Designs
### Aliases: rdsampsi

### ** Examples

# Toy dataset
X <- array(rnorm(2000),dim=c(1000,2))
R <- X[,1] + X[,2] + rnorm(1000)
Y <- 1 + R -.5*R^2 + .3*R^3 + (R>=0) + rnorm(1000)
# Sample size to achieve power of 0.8 against tau = 1
tmp <- rdsampsi(data=cbind(Y,R),tau=1)
# Sample size against tau = 1 including covariates
tmp <- rdsampsi(data=cbind(Y,R),tau=1,covs=X)





