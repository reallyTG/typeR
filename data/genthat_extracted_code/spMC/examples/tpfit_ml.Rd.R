library(spMC)


### Name: tpfit_ml
### Title: Mean Length Method for One-dimensional Model Parameters
###   Estimation
### Aliases: tpfit_ml
### Keywords: spatial distribution models

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# one-dimensional MC model
tpfit_ml(ACM$MAT5, ACM[, 1:3], c(0, 0, 1))
## End(No test)



