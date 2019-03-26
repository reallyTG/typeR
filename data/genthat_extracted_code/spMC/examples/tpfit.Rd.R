library(spMC)


### Name: tpfit
### Title: One-dimensional Model Parameters Estimation
### Aliases: tpfit
### Keywords: spatial distribution models

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# one-dimensional MC model
tpfit(ACM$MAT5, ACM[, 1:3], c(0, 0, 1))
## End(No test)


