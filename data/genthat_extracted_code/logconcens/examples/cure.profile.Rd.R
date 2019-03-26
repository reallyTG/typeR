library(logconcens)


### Name: cure.profile
### Title: Evaluate the profile log-likelihood on a grid of p_0-values.
### Aliases: cure.profile

### ** Examples

## The example from the logconcens-package help page:
set.seed(11)
x <- rgamma(50,3,1)
x <- cbind(x,ifelse(rexp(50,1/3) < x,Inf,x))

## Not run: 
##D plotint(x)
##D progrid <- seq(0.1,0.6,0.025)
##D prores <- cure.profile(x, progrid)
##D plot(progrid, prores$loglike)
##D prores$p0hat
##D res <- logcon(x, p0=prores$p0hat)
##D plot(res, type="survival")
## End(Not run)



