library(RiskPortfolios)


### Name: covEstimation
### Title: Covariance matrix estimation
### Aliases: covEstimation
### Keywords: htest

### ** Examples

# Load returns of assets or portfolios
data("Industry_10")
rets = Industry_10

# Naive covariance estimation
covEstimation(rets)

# Ewma estimation of the covariance with default lambda = 0.94
covEstimation(rets, control = list(type = 'ewma'))

# Ewma estimation of the covariance with default lambda = 0.90
covEstimation(rets, control = list(type = 'ewma', lambda = 0.9))

# Factor estimation of the covariance with dafault K = 1
covEstimation(rets, control = list(type = 'factor'))

# Factor estimation of the covariance with K = 3
covEstimation(rets, control = list(type = 'factor', K = 3))

# Ledot-Wolf's estimation of the covariance
covEstimation(rets, control = list(type = 'lw'))

# Shrinkage of the covariance matrix using constant correlation matrix
covEstimation(rets, control = list(type = 'const'))

# Shrinkage of the covariance matrix towards constant correlation matrix by
# Ledoit-Wolf.
covEstimation(rets, control = list(type = 'cor'))

# Shrinkage of the covariance matrix towards one-parameter matrix
covEstimation(rets, control = list(type = 'oneparm'))

# Shrinkage of the covaraince matrix towards diagonal matrix
covEstimation(rets, control = list(type = 'diag'))

# Shrinkage of the covariance matrix for large data set
covEstimation(rets, control = list(type = 'large'))



