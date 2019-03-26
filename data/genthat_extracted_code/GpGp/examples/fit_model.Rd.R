library(GpGp)


### Name: fit_model
### Title: Estimate mean and covariance parameters
### Aliases: fit_model

### ** Examples

n1 <- 10
n2 <- 10
n <- n1*n2
locs <- as.matrix( expand.grid( (1:n1)/n1, (1:n2)/n2 ) )
covparms <- c(2,0.1,1/2,0)
y <- 7 + fast_Gp_sim(covparms, "matern_isotropic", locs)
X <- as.matrix( rep(1,n) )
fit <- fit_model(y, locs, X, "matern_isotropic")
fit





