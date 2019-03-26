library(rvinecopulib)


### Name: mBICV
### Title: Modified vine copula Bayesian information criterion (mBICv)
### Aliases: mBICV

### ** Examples

u <- sapply(1:5, function(i) runif(50))
fit <- vinecop(u, "par", keep_data = TRUE)
mBICV(fit, 0.9) # with a 0.9 prior probability of a non-independence copula
mBICV(fit, 0.1) # with a 0.1 prior probability of a non-independence copula



