library(PerformanceAnalytics)


### Name: EWMAMoments
### Title: Functions for calculating EWMA comoments of financial time
###   series
### Aliases: EWMAMoments M2.ewma M3.ewma M4.ewma M3.ewma M4.ewma

### ** Examples


data(edhec)

# EWMA estimation
# 'as.mat = F' would speed up calculations in higher dimensions
sigma <- M2.ewma(edhec, 0.94)
m3 <- M3.ewma(edhec, 0.94)
m4 <- M4.ewma(edhec, 0.94)

# compute equal-weighted portfolio modified ES 
mu <- colMeans(edhec)
p <- length(mu)
ES(p = 0.95, portfolio_method = "component", weights = rep(1 / p, p), mu = mu, 
    sigma = sigma, m3 = m3, m4 = m4)

# compare to sample method
sigma <- cov(edhec)
m3 <- M3.MM(edhec)
m4 <- M4.MM(edhec)
ES(p = 0.95, portfolio_method = "component", weights = rep(1 / p, p), mu = mu, 
    sigma = sigma, m3 = m3, m4 = m4)




