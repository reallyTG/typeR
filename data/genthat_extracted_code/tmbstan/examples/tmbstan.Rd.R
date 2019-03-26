library(tmbstan)


### Name: tmbstan
### Title: Draw MCMC samples from a TMB model object using Stan
### Aliases: tmbstan

### ** Examples

runExample("simple")
fit <- tmbstan(obj, chains=1)
class(fit)  ## "stanfit"

## The available methods are
methods(class="stanfit")

## Not run: 
##D ## Pairs plot
##D pairs(fit, pars=names(obj$par))
## End(Not run)

## Trace plot
traceplot(fit, pars=names(obj$par), inc_warmup=TRUE)



