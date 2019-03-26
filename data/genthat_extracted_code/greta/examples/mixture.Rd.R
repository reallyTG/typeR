library(greta)


### Name: mixture
### Title: mixtures of probability distributions
### Aliases: mixture

### ** Examples

## Not run: 
##D # a scalar variable following a strange bimodal distibution
##D weights <- uniform(0, 1, dim = 3)
##D a <- mixture(normal(-3, 0.5),
##D              normal(3, 0.5),
##D              normal(0, 3),
##D              weights = weights)
##D m <- model(a)
##D plot(mcmc(m, n_samples = 500))
##D 
##D # simulate a mixture of poisson random variables and try to recover the
##D # parameters with a Bayesian model
##D x <- c(rpois(800, 3),
##D        rpois(200, 10))
##D 
##D weights <- uniform(0, 1, dim = 2)
##D rates <- normal(0, 10, truncation = c(0, Inf), dim = 2)
##D distribution(x) <- mixture(poisson(rates[1]),
##D                            poisson(rates[2]),
##D                            weights = weights)
##D m <- model(rates)
##D draws_rates <- mcmc(m, n_samples = 500)
##D 
##D # check the mixing probabilities after fitting using calculate()
##D # (you could also do this within the model)
##D normalized_weights <- weights / sum(weights)
##D draws_weights <- calculate(normalized_weights, draws_rates)
##D 
##D # get the posterior means
##D summary(draws_rates)$statistics[, "Mean"]
##D summary(draws_weights)$statistics[, "Mean"]
##D 
##D # weights can also be an array, giving different mixing weights
##D # for each observation (first dimension must be number of components)
##D dim <- c(5, 4)
##D weights <- uniform(0, 1, dim = c(2, dim))
##D b <- mixture(normal(1, 1, dim = dim),
##D              normal(-1, 1, dim = dim),
##D              weights = weights)
## End(Not run)



