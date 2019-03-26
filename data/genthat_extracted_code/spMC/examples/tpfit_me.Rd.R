library(spMC)


### Name: tpfit_me
### Title: Maximum Entropy Method for One-dimensional Model Parameters
###   Estimation
### Aliases: tpfit_me
### Keywords: spatial distribution models

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# one-dimensional MC model
tpfit_me(ACM$MAT5, ACM[, 1:3], c(0,0,1))
## End(No test)


