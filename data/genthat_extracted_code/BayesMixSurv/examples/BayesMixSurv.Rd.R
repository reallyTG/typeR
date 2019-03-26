library(BayesMixSurv)


### Name: bayesmixsurv
### Title: Dynamic Bayesian survival model - with stratification and Lasso
###   shrinkage - for right-censored data using two-component additive
###   mixture-of-Weibull hazards.
### Aliases: bayesmixsurv print.bayesmixsurv bayesmixsurv.control
### Keywords: ~kwd1 ~kwd2

### ** Examples

# NOTE: to ensure convergence, typically more than 100 samples are needed
# fit the most general model, with two Weibull components and unspecified shape parameters
ret <- bayesmixsurv(Surv(time, status)~as.factor(trt)+age+as.factor(celltype)+prior, veteran
  , control=bayesmixsurv.control(iter=100))
# fix one of the two shape parameters
ret2 <- bayesmixsurv(Surv(time, status)~as.factor(trt)+age+as.factor(celltype)+prior, veteran
    , control=bayesmixsurv.control(iter=100, alpha2.fixed=1.0))



