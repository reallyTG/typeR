library(rstanarm)


### Name: log_lik.stanreg
### Title: Pointwise log-likelihood matrix
### Aliases: log_lik.stanreg log_lik log_lik.stanmvreg log_lik.stanjm

### ** Examples

## No test: 
 roaches$roach100 <- roaches$roach1 / 100
 fit <- stan_glm(
    y ~ roach100 + treatment + senior,
    offset = log(exposure2),
    data = roaches,
    family = poisson(link = "log"),
    prior = normal(0, 2.5),
    prior_intercept = normal(0, 10),
    iter = 500 # to speed up example
 )
 ll <- log_lik(fit)
 dim(ll)
 all.equal(ncol(ll), nobs(fit))

 # using newdata argument
 nd <- roaches[1:2, ]
 nd$treatment[1:2] <- c(0, 1)
 ll2 <- log_lik(fit, newdata = nd, offset = c(0, 0))
 head(ll2)
 dim(ll2)
 all.equal(ncol(ll2), nrow(nd))
## End(No test)




