library(gcmr)


### Name: gcmr
### Title: Fitting Gaussian Copula Marginal Regression Models by Maximum
###   (Simulated) Likelihood.
### Aliases: gcmr gcmr.fit
### Keywords: regression nonlinear

### ** Examples

## negative binomial model for longitudinal data
data(epilepsy)
gcmr(counts ~ offset(log(time)) + visit + trt + visit:trt, data = epilepsy, 
subset = (id != 49), marginal = negbin.marg, cormat = cluster.cormat(id, "ar1"), 
options=gcmr.options(seed=123, nrep=100 ))
## Hidden Unemployment Rate (HUR) data (Rocha and Cribari-Neto, 2009)
## beta regression with ARMA(1,3) errors
data(HUR)
trend <- scale(time(HUR))
gcmr(HUR ~ trend | trend, marginal = beta.marg, cormat = arma.cormat(1, 3))



