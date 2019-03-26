library(dynfrail)


### Name: dynfrail
### Title: Fitting dynamic frailty models with the EM algorithm
### Aliases: dynfrail

### ** Examples

# 5 piecewise constant intervals
m2 <- dynfrail(Surv(time, status) ~ rx + sex + cluster(litter),
data = rats,
distribution = dynfrail_dist(n_ints = 4))

## Not run: 
##D #' # essentially a gamma frailty fit
##D m1 <- dynfrail(Surv(time, status) ~ rx + sex + cluster(litter),
##D data = rats,
##D distribution = dynfrail_dist(n_ints = 0))
##D 
##D # completely semiparametric gamma frailty
##D m2 <- dynfrail(Surv(time, status) ~ rx + sex + cluster(litter),
##D data = rats)
## End(Not run)



