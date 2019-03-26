library(brms)


### Name: post_prob.brmsfit
### Title: Posterior Model Probabilities from Marginal Likelihoods
### Aliases: post_prob.brmsfit post_prob

### ** Examples

## Not run: 
##D # model with the treatment effect
##D fit1 <- brm(
##D   count ~ log_Age_c + log_Base4_c + Trt_c,
##D   data = epilepsy, family = negbinomial(), 
##D   prior = prior(normal(0, 1), class = b),
##D   save_all_pars = TRUE
##D )
##D summary(fit1)
##D 
##D # model without the treatent effect
##D fit2 <- brm(
##D   count ~ log_Age_c + log_Base4_c,
##D   data = epilepsy, family = negbinomial(), 
##D   prior = prior(normal(0, 1), class = b),
##D   save_all_pars = TRUE
##D )
##D summary(fit2)
##D 
##D # compute the posterior model probabilities
##D post_prob(fit1, fit2)
##D 
##D # specify prior model probabilities
##D post_prob(fit1, fit2, prior_prob = c(0.8, 0.2))
## End(Not run)




