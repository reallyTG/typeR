library(PerformanceAnalytics)


### Name: StructuredMoments
### Title: Functions for calculating structured comoments of financial time
###   series
### Aliases: StructuredMoments M2.struct M3.struct M4.struct M3.struct
###   M4.struct

### ** Examples


data(edhec)

# structured estimation with constant correlation model
# 'as.mat = F' would speed up calculations in higher dimensions
sigma <- M2.struct(edhec, "CC")
m3 <- M3.struct(edhec, "CC")
m4 <- M4.struct(edhec, "CC")

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




