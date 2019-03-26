library(PortfolioAnalytics)


### Name: leverage_exposure_constraint
### Title: constructor for leverage_exposure_constraint
### Aliases: leverage_exposure_constraint

### ** Examples

data(edhec)
ret <- edhec[, 1:4]

pspec <- portfolio.spec(assets=colnames(ret))

pspec <- add.constraint(portfolio=pspec, type="leverage_exposure", leverage=1.6)



