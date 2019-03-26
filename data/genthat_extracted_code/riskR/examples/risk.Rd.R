library(riskR)


### Name: risk
### Title: Computes risk measures
### Aliases: risk

### ** Examples

# computes risk measures for the SP500 

data(returns)
s <- returns[, 2]
risk(s, c(0.01, 0.05))



