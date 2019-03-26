library(PortfolioAnalytics)


### Name: diversification_constraint
### Title: constructor for diversification_constraint
### Aliases: diversification_constraint

### ** Examples

data(edhec)
ret <- edhec[, 1:4]

pspec <- portfolio.spec(assets=colnames(ret))

pspec <- add.constraint(portfolio=pspec, type="diversification", div_target=0.7)



