library(spMC)


### Name: is.tpfit
### Title: Object test for tpfit class
### Aliases: is.tpfit
### Keywords: spatial attribute

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# one-dimensional MC model
MoPa <- tpfit(ACM$MAT5, ACM[, 1:3], c(0, 0, 1))

# Test the object MoPa
is.tpfit(MoPa)
## End(No test)


