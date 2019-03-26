library(BLModel)


### Name: BL_post_distr
### Title: Computes the Black-Litterman posterior distribution.
### Aliases: BL_post_distr

### ** Examples

library(mvtnorm)
k = 3 
num =100
dat <-  cbind(rmvnorm (n=num, mean = rep(0,k), sigma=diag(k)), matrix(1/num,num,1)) 
# a data sample with num rows and (k+1) columns for k assets;
returns_freq = 52 # we assume that data frequency is 1 week
w_m <- rep(1/k,k) # benchmark portfolio, a vector of length k,
SR = 0.5 # Sharpe ratio
Pe <- diag(k) # we assume that views are "absolute views"
qe <- rep(0.05, k) # user's opinions on future returns (views)
tau = 0.02
BL_post_distr(dat, returns_freq, NULL, w_m, SR, Pe, qe, tau, risk = "MAD", alpha = 0,
views_distr = observ_normal, "diag", cov_matrix = NULL)







