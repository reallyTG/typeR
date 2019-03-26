library(spMC)


### Name: is.multi_transiogram
### Title: Object test for multi_transiogram class
### Aliases: is.multi_transiogram
### Keywords: spatial attribute

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
TrPr <- predict(RTm, lags)

# Test the object TrPr
is.multi_transiogram(TrPr)
## End(No test)


