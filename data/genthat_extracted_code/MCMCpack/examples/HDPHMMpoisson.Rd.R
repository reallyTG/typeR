library(MCMCpack)


### Name: HDPHMMpoisson
### Title: Markov Chain Monte Carlo for sticky HDP-HMM with a Poisson
###   outcome distribution
### Aliases: HDPHMMpoisson
### Keywords: models

### ** Examples


 ## Not run: 
##D    n <- 150
##D    reg <- 3
##D    true.s <- gl(reg, n/reg, n)
##D    b1.true <- c(1, -2, 2)
##D    x1 <- runif(n, 0, 2)
##D    mu <- exp(1 + x1 * b1.true[true.s])
##D    y <- rpois(n, mu)
##D 
##D    posterior <- HDPHMMpoisson(y ~ x1, K = 10, verbose = 1000,
##D                           a.theta = 100, b.theta = 1,
##D                           b0 = rep(0, 2), B0 = (1/9) * diag(2),
##D                           seed = list(NA, 2),
##D                           theta.start = 0.95, gamma.start = 10,
##D                           ak.start = 10)
##D 
##D    plotHDPChangepoint(posterior, ylab="Density", start=1)
##D    
## End(Not run)




