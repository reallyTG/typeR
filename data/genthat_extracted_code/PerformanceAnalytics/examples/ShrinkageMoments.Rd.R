library(PerformanceAnalytics)


### Name: ShrinkageMoments
### Title: Functions for calculating shrinkage-based comoments of financial
###   time series
### Aliases: ShrinkageMoments M2.shrink M3.shrink M4.shrink M3.shrink
###   M4.shrink

### ** Examples


data(edhec)

# construct an underlying factor (market-factor, observed factor, PCA, ...)
f <- rowSums(edhec)

# multi-target shrinkage with targets 1, 3 and 4
# as.mat = F' would speed up calculations in higher dimensions
targets <- c(1, 3, 4)
sigma <- M2.shrink(edhec, targets, f)$M2sh
m3 <- M3.shrink(edhec, targets, f)$M3sh
m4 <- M4.shrink(edhec, targets, f)$M4sh

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




