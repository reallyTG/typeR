library(MCMCpack)


### Name: MCmultinomdirichlet
### Title: Monte Carlo Simulation from a Multinomial Likelihood with a
###   Dirichlet Prior
### Aliases: MCmultinomdirichlet
### Keywords: models

### ** Examples


## Not run: 
##D ## Example from Gelman, et. al. (1995, p. 78)
##D posterior <- MCmultinomdirichlet(c(727,583,137), c(1,1,1), mc=10000)
##D bush.dukakis.diff <- posterior[,1] - posterior[,2]
##D cat("Pr(Bush > Dukakis): ",
##D    sum(bush.dukakis.diff > 0) / length(bush.dukakis.diff), "\n")
##D hist(bush.dukakis.diff)
## End(Not run)




