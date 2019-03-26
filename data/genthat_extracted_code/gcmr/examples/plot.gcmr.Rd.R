library(gcmr)


### Name: plot.gcmr
### Title: Plot Diagnostics for Gaussian Copula Marginal Regression
### Aliases: plot.gcmr

### ** Examples

## beta regression with ARMA(1,3) errors
data(HUR)
trend <- scale(time(HUR))
m <- gcmr(HUR ~ trend | trend, marginal = beta.marg, cormat = arma.cormat(1, 3))
## normal probability plot
plot(m,  3)
## autocorrelation function of residuals
plot(m,  5)



