library(riskR)


### Name: risk.req
### Title: Computes capital requirements based on risk measures
### Aliases: risk.req

### ** Examples

## computes capital requirement for a position of U$ 1,000 on SP500 for five days

data(returns)
s <- returns[, 2]
risk.req(s, 1000, 5, c(0.01, 0.05))



