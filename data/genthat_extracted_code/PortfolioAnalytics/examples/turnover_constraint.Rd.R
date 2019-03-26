library(PortfolioAnalytics)


### Name: turnover_constraint
### Title: constructor for turnover_constraint
### Aliases: turnover_constraint

### ** Examples

data(edhec)
ret <- edhec[, 1:4]

pspec <- portfolio.spec(assets=colnames(ret))

pspec <- add.constraint(portfolio=pspec, type="turnover", turnover_target=0.6)



