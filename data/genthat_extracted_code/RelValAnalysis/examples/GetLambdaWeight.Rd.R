library(RelValAnalysis)


### Name: GetLambdaWeight
### Title: Portfolio Weights of the Lambda-strategy
### Aliases: GetLambdaWeight

### ** Examples

data(applestarbucks)
market <- toymkt(applestarbucks)
weight <- GetLambdaWeight(market, initial.weight = c(0.5, 0.5), lambda = 0.2)
decomp <- EnergyEntropyDecomp(market, weight, plot = TRUE)



