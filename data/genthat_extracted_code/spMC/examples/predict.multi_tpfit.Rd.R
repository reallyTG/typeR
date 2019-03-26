library(spMC)


### Name: predict.multi_tpfit
### Title: Compute Theoretical Multidimensional Transiograms
### Aliases: predict.multi_tpfit
### Keywords: spatial distribution models

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# multidimensional MC model
RTm <- multi_tpfit(ACM$MAT3, ACM[, 1:3])

# Generate the matrix of 
# multidimensional lags
lags <- expand.grid(X=-1:1, Y=-1:1, Z=-1:1)
lags <- as.matrix(lags)

# Compute transition probabilities 
# from the multidimensional MC model
predict(RTm, lags)
## End(No test)


