library(brms)


### Name: loo_predict.brmsfit
### Title: Compute Weighted Expectations Using LOO
### Aliases: loo_predict.brmsfit loo_predict loo_linpred
###   loo_predictive_interval loo_linpred.brmsfit
###   loo_predictive_interval.brmsfit

### ** Examples

## Not run: 
##D ## data from help("lm")
##D ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
##D trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
##D d <- data.frame(
##D   weight = c(ctl, trt), 
##D   group = gl(2, 10, 20, labels = c("Ctl", "Trt"))
##D ) 
##D fit <- brm(weight ~ group, data = d)
##D loo_predictive_interval(fit, prob = 0.8)
##D 
##D ## optionally log-weights can be pre-computed and reused
##D psis <- loo::psis(-log_lik(fit), cores = 2)
##D loo_predictive_interval(fit, prob = 0.8, psis_object = psis)
##D loo_predict(fit, type = "var", psis_object = psis)
## End(Not run)




