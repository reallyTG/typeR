library(brms)


### Name: inhaler
### Title: Clarity of inhaler instructions
### Aliases: inhaler
### Keywords: datasets

### ** Examples

## Not run: 
##D ## ordinal regression with family "sratio"
##D fit1 <- brm(rating ~ treat + period + carry, 
##D             data = inhaler, family = sratio(), 
##D             prior = set_prior("normal(0,5)"))
##D summary(fit1) 
##D plot(fit1)
##D        
##D ## ordinal regression with family "cumulative" 
##D ## and random intercept over subjects             
##D fit2 <- brm(rating ~ treat + period + carry + (1|subject), 
##D               data = inhaler, family = cumulative(), 
##D               prior = set_prior("normal(0,5)"))
##D summary(fit2) 
##D plot(fit2)
## End(Not run)




