library(riskR)


### Name: risk.port
### Title: Computes optimal weights of portfolio based on risk measures
### Aliases: risk.port

### ** Examples

## Computes optimal weights of a portfolio strategy composed by AAPL, BAC, DOW and SUNE.

data(returns)
s <- returns[1:100, 3:6]
risk.port(s, 0.05)



