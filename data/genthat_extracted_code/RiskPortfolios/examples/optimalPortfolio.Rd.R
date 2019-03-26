library(RiskPortfolios)


### Name: optimalPortfolio
### Title: Optimal portfolio
### Aliases: optimalPortfolio
### Keywords: optimize

### ** Examples

# Load returns of assets or portfolios
data("Industry_10")
rets = Industry_10

# Mean estimation
mu = meanEstimation(rets)

# Covariance estimation
Sigma = covEstimation(rets)

# Semi-deviation estimation
semiDev = semidevEstimation(rets)

# Mean-variance portfolio without constraint and gamma = 0.89
optimalPortfolio(mu = mu, Sigma = Sigma)

# Mean-variance portfolio without constraint and gamma = 1
optimalPortfolio(mu = mu, Sigma = Sigma, 
  control = list(gamma = 1))

# Mean-variance portfolio without constraint and gamma = 0.89
optimalPortfolio(mu = mu, Sigma = Sigma, 
  control = list(type = 'mv'))

# Mean-variance portfolio without constraint and gamma = 0.89
optimalPortfolio(mu = mu, Sigma = Sigma, 
  control = list(type = 'mv', constraint = 'none'))

# Mean-variance portfolio with the long-only constraint and gamma = 0.89
optimalPortfolio(mu = mu, Sigma = Sigma, 
  control = list(type = 'mv', constraint = 'lo'))

# Mean-variance portfolio with LB and UB constraints
optimalPortfolio(mu = mu, Sigma = Sigma, 
  control = list(type = 'mv', constraint = 'user', LB = rep(0.02, 10), UB = rep(0.8, 10)))

# Mean-variance portfolio with the gross constraint, 
# gross constraint parameter = 1.6 and gamma = 0.89
optimalPortfolio(mu = mu, Sigma = Sigma, 
  control = list(type = 'mv', constraint = 'gross'))

# Mean-variance portfolio with the gross constraint, 
# gross constraint parameter = 1.2 and gamma = 0.89
optimalPortfolio(mu = mu, Sigma = Sigma, 
  control = list(type = 'mv', constraint = 'gross', gross.c = 1.2))

# Minimum volatility portfolio without constraint
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'minvol'))

# Minimum volatility portfolio without constraint
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'minvol', constraint = 'none'))

# Minimim volatility portfolio with the long-only constraint
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'minvol', constraint = 'lo'))
  
# Minimim volatility portfolio with LB and UB constraints
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'minvol', constraint = 'user', LB = rep(0.02, 10), UB = rep(0.8, 10)))

# Minimum volatility portfolio with the gross constraint 
# and the gross constraint parameter = 1.6
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'minvol', constraint = 'gross'))

# Minimum volatility portfolio with the gross constraint 
# and the gross parameter = 1.2
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'minvol', constraint = 'gross', gross.c = 1.2))
    
# Inverse volatility portfolio
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'invvol'))

# Equal-risk-contribution portfolio with the long-only constraint
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'erc', constraint = 'lo'))
  
# Equal-risk-contribution portfolio with LB and UB constraints
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'erc', constraint = 'user', LB = rep(0.02, 10), UB = rep(0.8, 10)))

# Maximum diversification portfolio without constraint
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'maxdiv'))

# Maximum diversification portoflio with the long-only constraint
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'maxdiv', constraint = 'lo'))
  
# Maximum diversification portoflio with LB and UB constraints
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'maxdiv', constraint = 'user', LB = rep(0.02, 10), UB = rep(0.8, 10)))

# Risk-efficient portfolio without constraint
optimalPortfolio(Sigma = Sigma, semiDev = semiDev, 
  control = list(type = 'riskeff'))

# Risk-efficient portfolio with the long-only constraint
optimalPortfolio(Sigma = Sigma, semiDev = semiDev, 
  control = list(type = 'riskeff', constraint = 'lo'))
  
# Risk-efficient portfolio with LB and UB constraints
optimalPortfolio(Sigma = Sigma, semiDev = semiDev, 
  control = list(type = 'riskeff', constraint = 'user', LB = rep(0.02, 10), UB = rep(0.8, 10)))
  
# Maximum decorrelation portfolio without constraint
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'maxdec'))

# Maximum decorrelation portoflio with the long-only constraint
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'maxdec', constraint = 'lo'))
  
# Maximum decorrelation portoflio with LB and UB constraints
optimalPortfolio(Sigma = Sigma, 
  control = list(type = 'maxdec', constraint = 'user', LB = rep(0.02, 10), UB = rep(0.8, 10)))



