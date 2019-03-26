library(riskR)


### Name: risk.hedge
### Title: Computes optimal hedging ratios based on risk measures
### Aliases: risk.hedge

### ** Examples

## computes optimal hedging ratios between AAPL and SP500.

data(returns)
s <- returns[, 3]
h <- returns[, 2]
risk.hedge(s, h, c(0.01, 0.05))



