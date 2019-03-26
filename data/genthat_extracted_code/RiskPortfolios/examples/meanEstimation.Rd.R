library(RiskPortfolios)


### Name: meanEstimation
### Title: Estimation of mean returns
### Aliases: meanEstimation
### Keywords: htest

### ** Examples

# Load returns of assets or portfolios
data("Industry_10")
rets = Industry_10

# Naive estimation of the mean
meanEstimation(rets)

# Naive estimation of the mean
meanEstimation(rets, control = list(type = 'naive'))

# Ewma estimation of the mean with default lambda = 0.94
meanEstimation(rets, control = list(type = 'ewma'))

# Ewma estimation of the mean with lambda = 0.9
meanEstimation(rets, control = list(type = 'ewma', lambda = 0.9))

# Martinelli's estimation of the mean
meanEstimation(rets, control = list(type = 'mart'))

# Bayes-Stein's estimation of the mean
meanEstimation(rets, control = list(type = 'bs'))



