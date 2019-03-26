library(PortfolioAnalytics)


### Name: return_constraint
### Title: constructor for return_constraint
### Aliases: return_constraint

### ** Examples

data(edhec)
ret <- edhec[, 1:4]

pspec <- portfolio.spec(assets=colnames(ret))

pspec <- add.constraint(portfolio=pspec, type="return", return_target=mean(colMeans(ret)))



