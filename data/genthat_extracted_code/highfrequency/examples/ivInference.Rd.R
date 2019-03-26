library(highfrequency)


### Name: ivInference
### Title: Function returns the value, the standard error and the
###   confidence band of the integrated variance (IV) estimator.
### Aliases: ivInference
### Keywords: highfrequency ivInference

### ** Examples

data(sample_tdata)
ivInference(sample_tdata$PRICE, IVestimator= "minRV", IQestimator= "medRQ", 
            confidence=0.95, makeReturns = TRUE)



