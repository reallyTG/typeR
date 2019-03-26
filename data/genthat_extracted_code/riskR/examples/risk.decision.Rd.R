library(riskR)


### Name: risk.decision
### Title: Decides the best alternative based on risk measures
### Aliases: risk.decision

### ** Examples

## Decides which is the best investment alternative among AAPL, BAC, DOW and SUNE.

data(returns)
s <- returns[, 3:6]
risk.decision(s, c(0.01, 0.05))



