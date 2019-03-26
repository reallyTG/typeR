library(PerformanceAnalytics)


### Name: portfolio_bacon
### Title: Bacon(2008) Data
### Aliases: portfolio_bacon
### Keywords: datasets

### ** Examples

data(portfolio_bacon)

#preview the data
head(portfolio_bacon)

#summary period statistics
summary(portfolio_bacon)

#cumulative returns
tail(cumprod(1+portfolio_bacon),1)



