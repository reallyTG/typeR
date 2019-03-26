library(PortfolioAnalytics)


### Name: transaction_cost_constraint
### Title: constructor for transaction_cost_constraint
### Aliases: transaction_cost_constraint

### ** Examples

data(edhec)
ret <- edhec[, 1:4]

pspec <- portfolio.spec(assets=colnames(ret))

pspec <- add.constraint(portfolio=pspec, type="transaction_cost", ptc=0.01)



