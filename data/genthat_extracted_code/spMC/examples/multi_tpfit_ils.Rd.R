library(spMC)


### Name: multi_tpfit_ils
### Title: Iterated Least Squares Method for Multidimensional Model
###   Parameters Estimation
### Aliases: multi_tpfit_ils
### Keywords: spatial distribution models

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# multidimensional MC model
multi_tpfit_ils(ACM$MAT3, ACM[, 1:3], 100)
## End(No test)


