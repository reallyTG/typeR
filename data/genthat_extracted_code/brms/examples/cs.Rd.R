library(brms)


### Name: cs
### Title: Category Specific Predictors in 'brms' Models
### Aliases: cs cse

### ** Examples

  
## Not run: 
##D fit <- brm(rating ~ period + carry + cs(treat), 
##D            data = inhaler, family = sratio("cloglog"), 
##D            prior = set_prior("normal(0,5)"), chains = 2)
##D summary(fit)
##D plot(fit, ask = FALSE)
## End(Not run) 
 



