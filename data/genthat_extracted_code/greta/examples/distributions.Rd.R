library(greta)


### Name: distributions
### Title: probability distributions
### Aliases: distributions uniform normal lognormal bernoulli binomial
###   beta_binomial negative_binomial hypergeometric poisson gamma
###   inverse_gamma weibull exponential pareto student laplace beta cauchy
###   chi_squared logistic f multivariate_normal wishart lkj_correlation
###   multinomial categorical dirichlet dirichlet_multinomial

### ** Examples

## Not run: 
##D 
##D # a uniform parameter constrained to be between 0 and 1
##D phi <- uniform(min = 0, max = 1)
##D 
##D # a length-three variable, with each element following a standard normal
##D # distribution
##D alpha <- normal(0, 1, dim = 3)
##D 
##D # a length-three variable of lognormals
##D sigma <- lognormal(0, 3, dim = 3)
##D 
##D # a hierarchical uniform, constrained between alpha and alpha + sigma,
##D eta <- alpha + uniform(0, 1, dim = 3) * sigma
##D 
##D # a hierarchical distribution
##D mu <- normal(0, 1)
##D sigma <- lognormal(0, 1)
##D theta <- normal(mu, sigma)
##D 
##D # a vector of 3 variables drawn from the same hierarchical distribution
##D thetas <- normal(mu, sigma, dim = 3)
##D 
##D # a matrix of 12 variables drawn from the same hierarchical distribution
##D thetas <- normal(mu, sigma, dim = c(3, 4))
##D 
##D # a multivariate normal variable, with correlation between two elements
##D # note that the parameter must be a row vector
##D Sig <- diag(4)
##D Sig[3, 4] <- Sig[4, 3] <- 0.6
##D theta <- multivariate_normal(t(rep(mu, 4)), Sig)
##D 
##D # 10 independent replicates of that
##D theta <- multivariate_normal(t(rep(mu, 4)), Sig, n_realisations = 10)
##D 
##D # 10 multivariate normal replicates, each with a different mean vector,
##D # but the same covariance matrix
##D means <- matrix(rnorm(40), 10, 4)
##D theta <- multivariate_normal(means, Sig, n_realisations = 10)
##D dim(theta)
##D 
##D # a Wishart variable with the same covariance parameter
##D theta <- wishart(df = 5, Sigma = Sig)
##D 
## End(Not run)



