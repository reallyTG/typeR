library(brms)


### Name: compare_ic
### Title: Compare Information Criteria of Different Models
### Aliases: compare_ic

### ** Examples

## Not run: 
##D # model with population-level effects only
##D fit1 <- brm(rating ~ treat + period + carry,
##D             data = inhaler, family = "gaussian")
##D waic1 <- WAIC(fit1)
##D 
##D # model with an additional varying intercept for subjects
##D fit2 <- brm(rating ~ treat + period + carry + (1|subject),
##D             data = inhaler, family = "gaussian")
##D waic2 <- WAIC(fit2)
##D 
##D # compare both models
##D compare_ic(waic1, waic2)
## End(Not run)




