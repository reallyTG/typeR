library(RiskPortfolios)


### Name: semidevEstimation
### Title: Estimation of the semideviation
### Aliases: semidevEstimation
### Keywords: htest

### ** Examples

# Load returns of assets or portfolios
data("Industry_10")
rets = Industry_10

# Naive semideviation estimation
semidevEstimation(rets)

# Naive estimation of the semideviation
semidevEstimation(rets, control = list(type = 'naive'))

# Ewma estimation of the semideviation. Default lambda = 0.94
semidevEstimation(rets, control = list(type = 'ewma'))

# Ewma estimation of the semideviation. lambda = 0.9
semidevEstimation(rets, control = list(type = 'ewma', lambda = 0.9))



