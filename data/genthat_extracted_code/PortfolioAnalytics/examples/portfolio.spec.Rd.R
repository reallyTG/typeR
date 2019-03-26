library(PortfolioAnalytics)


### Name: portfolio.spec
### Title: constructor for class portfolio
### Aliases: portfolio.spec portfolio

### ** Examples

data(edhec)
pspec <- portfolio.spec(assets=colnames(edhec))
pspec <- portfolio.spec(assets=10, weight_seq=generatesequence())



