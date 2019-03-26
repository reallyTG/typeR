library(spMC)


### Name: is.multi_tpfit
### Title: Object test for multi_tpfit class
### Aliases: is.multi_tpfit
### Keywords: spatial attribute

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# multidimensional MC models
MoPa <- multi_tpfit(ACM$MAT5, ACM[, 1:3])

# Test the object MoPa
is.multi_tpfit(MoPa)
## End(No test)


