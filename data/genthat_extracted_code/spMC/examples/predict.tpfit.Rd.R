library(spMC)


### Name: predict.tpfit
### Title: Compute Theoretical One-dimensional Transiograms
### Aliases: predict.tpfit
### Keywords: spatial distribution models

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# one-dimensional MC model
RTm <- tpfit(ACM$MAT3, ACM[, 1:3], c(0, 0, 1))

# Compute transition probabilities 
# from the one-dimensional MC model
predict(RTm, lags = 0:2/2)
## End(No test)


