library(spMC)


### Name: tpfit_ils
### Title: Iterated Least Squares Method for One-dimensional Model
###   Parameters Estimation
### Aliases: tpfit_ils
### Keywords: spatial distribution models

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# one-dimensional MC model
tpfit_ils(ACM$MAT3, ACM[, 1:3], c(0,0,1), 100)
## End(No test)


