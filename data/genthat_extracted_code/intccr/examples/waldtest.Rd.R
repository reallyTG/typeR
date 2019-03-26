library(intccr)


### Name: waldtest
### Title: Wald test for 'ciregic'
### Aliases: waldtest

### ** Examples

## Continuing the ciregic(...) example
## Not run: 
##D ## Bootstrap variance estimation based on 5 replications
##D set.seed(12345)
##D fit <- ciregic(formula = Surv2(v, u, c) ~ z1 + z2, data = newdata,
##D                alpha = c(1, 1), nboot = 5, do.par = FALSE)
##D waldtest(obj1 = fit)
##D set.seed(12345)
##D fit.nested <- ciregic(formula = Surv2(v, u, c) ~ z2, data = newdata,
##D                alpha = c(1, 1), nboot = 5, do.par = FALSE)
##D waldtest(obj1 = fit, obj2 = fit.nested)
## End(Not run)




