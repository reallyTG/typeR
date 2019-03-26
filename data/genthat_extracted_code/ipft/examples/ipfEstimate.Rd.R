library(ipft)


### Name: ipfEstimate
### Title: Estimates the location of the test observations
### Aliases: ipfEstimate

### ** Examples


    model <- ipfKnn(ipftrain[, 1:168], ipftrain[, 169:170])
    estimation <- ipfEstimate(model, ipftest[, 1:168], ipftest[, 169:170])

## Not run: 
##D     model <- ipfProbabilistic(ipftrain[, 1:168], ipftrain[, 169:170], k = 9, delta = 10)
##D     estimation <- ipfEstimate(model, ipftest[, 1:170], ipftest[, 169:170])
## End(Not run)



