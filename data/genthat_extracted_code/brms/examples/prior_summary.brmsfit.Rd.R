library(brms)


### Name: prior_summary.brmsfit
### Title: Extract Priors of a Bayesian Model Fitted with 'brms'
### Aliases: prior_summary.brmsfit prior_summary

### ** Examples

## Not run: 
##D fit <- brm(count ~ log_Age_c + log_Base4_c * Trt_c  
##D              + (1|patient) + (1|obs), 
##D            data = epilepsy, family = poisson(), 
##D            prior = c(prior(student_t(5,0,10), class = b),
##D                      prior(cauchy(0,2), class = sd)))
##D                    
##D prior_summary(fit)
##D prior_summary(fit, all = FALSE)
##D print(prior_summary(fit, all = FALSE), show_df = FALSE)
## End(Not run)




