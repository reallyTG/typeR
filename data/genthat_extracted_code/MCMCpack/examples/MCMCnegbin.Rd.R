library(MCMCpack)


### Name: MCMCnegbin
### Title: Markov Chain Monte Carlo for Negative Binomial Regression
### Aliases: MCMCnegbin
### Keywords: models

### ** Examples


 ## Not run: 
##D    n <- 150
##D    mcmcs <- 5000
##D    burnin <- 5000
##D    thin <- 5
##D    x1 <- runif(n, 0, 2)
##D    rho.true <- 1.5
##D    nu.true <- rgamma(n, rho.true, rho.true)
##D    mu <- nu.true * exp(1 + x1 * 1)
##D    y <- rpois(n, mu)
##D    posterior <- MCMCnegbin(y ~ x1)
##D    plot(posterior)
##D    summary(posterior)
##D    
## End(Not run)




