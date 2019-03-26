library(RelValAnalysis)


### Name: GetWeight
### Title: Computing Portfolio Weights from a Weight Function
### Aliases: GetWeight

### ** Examples

data(applestarbucks) 
market <- toymkt(applestarbucks)

# This is the diversity-weighted portfolio
weight.function <- function(x, p) {
  return(x^p / sum(x^p))
}

weight <- GetWeight(market, weight.function, p = 0.7)
Invest(market, weight)



