library(spMC)


### Name: is.transiogram
### Title: Object test for transiogram class
### Aliases: is.transiogram
### Keywords: spatial attribute

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# one-dimensional MC model
RTm <- tpfit(ACM$MAT5, ACM[, 1:3], c(0, 0, 1))

# Compute theoretical transition probabilities 
# from the one-dimensional MC model
TTPr <- predict(RTm, lags = 0:2/2)

# Compute empirical transition probabilities 
ETPr <- transiogram(ACM$MAT5, ACM[, 1:3], c(0, 0, 1), 200, 20)

# Test the objects TTPr and ETPr
is.transiogram(TTPr)
is.transiogram(ETPr)
## End(No test)


