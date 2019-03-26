library(riskR)


### Name: risk.roll
### Title: Computes risk measures through rolling scheme
### Aliases: risk.roll

### ** Examples

## computes risk measures for SP500 using one year of daily data.

data(returns)
s <- returns[, 2]
risk.roll(s, 250, c(0.01, 0.05))



