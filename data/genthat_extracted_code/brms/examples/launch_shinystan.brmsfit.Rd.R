library(brms)


### Name: launch_shinystan.brmsfit
### Title: Interface to 'shinystan'
### Aliases: launch_shinystan.brmsfit launch_shinystan

### ** Examples

## Not run: 
##D fit <- brm(rating ~ treat + period + carry + (1|subject),
##D            data = inhaler, family = "gaussian")
##D launch_shinystan(fit)                         
## End(Not run)




