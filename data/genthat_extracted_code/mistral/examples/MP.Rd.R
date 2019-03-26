library(mistral)


### Name: MP
### Title: Moving Particles
### Aliases: LPA MP

### ** Examples

## Not run: 
##D # Estimate some probability and quantile with the parabolic lsf
##D p.est <- MP(2, kiureghian, N = 100, q = 0) # estimate P(lsf(X) < 0)
##D p.est <- MP(2, kiureghian, N = 100, q = 7.8, lower.tail = FALSE) # estimate P(lsf(X) > 7.8)
##D 
##D q.est <- MP(2, kiureghian, N = 100, p = 1e-3) # estimate q such that P(lsf(X) < q) = 1e-3
##D q.est <- MP(2, kiureghian, N = 100, p = 1e-3, lower.tail = FALSE) # estimate q such
##D # that P(lsf(X) > q) = 1e-3
##D 
##D 
##D # plot the empirical cdf
##D plot(xplot <- seq(-3, p.est$L_max, l = 100), sapply(xplot, p.est$ecdf_MP))
##D 
##D # check validity range
##D p.est$ecdf_MP(p.est$L_max - 1)
##D # this example will fail because the quantile is greater than the limit
##D tryCatch({
##D    p.est$ecdf_MP(p.est$L_max + 0.1)},
##D    error = function(cond) message(cond))
##D 
##D # Run in parallel
##D library(doParallel)
##D registerDoParallel()
##D p.est <- MP(2, kiureghian, N = 100, q = 0, N.batch = getDoParWorkers())
## End(Not run)




