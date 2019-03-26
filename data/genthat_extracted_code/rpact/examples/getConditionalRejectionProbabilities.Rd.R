library(rpact)


### Name: getConditionalRejectionProbabilities
### Title: Get Conditional Rejection Probabilities
### Aliases: getConditionalRejectionProbabilities
### Keywords: internal

### ** Examples


x <- getDesignFisher(kMax = 3, informationRates = c(0.1,0.8,1))
y <- getDataset(n = c(40,40), events = c(20,22))
getConditionalRejectionProbabilities(x, getStageResults(x, y, thetaH0 = 0.4))
# provides 
# [1] 0.0216417 0.1068607        NA




