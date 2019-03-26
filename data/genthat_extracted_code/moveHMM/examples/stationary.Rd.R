library(moveHMM)


### Name: stationary
### Title: Stationary state probabilities
### Aliases: stationary

### ** Examples

# m is a moveHMM object (as returned by fitHMM), automatically loaded with the package
m <- example$m

# data frame of covariates
stationary(m, covs = data.frame(cov1 = 0, cov2 = 0))

# design matrix (each column corresponds to row of m$mle$beta)
stationary(m, covs = matrix(c(1,0,cos(0)),1,3))




