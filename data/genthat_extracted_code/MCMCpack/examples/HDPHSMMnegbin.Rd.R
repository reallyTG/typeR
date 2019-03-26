library(MCMCpack)


### Name: HDPHSMMnegbin
### Title: Markov Chain Monte Carlo for HDP-HSMM with a Negative Binomial
###   outcome distribution
### Aliases: HDPHSMMnegbin
### Keywords: models

### ** Examples


 ## Not run: 
##D    n <- 150
##D    reg <- 3
##D    true.s <- gl(reg, n/reg, n)
##D    rho.true <- c(1.5, 0.5, 3)
##D    b1.true <- c(1, -2, 2)
##D    x1 <- runif(n, 0, 2)
##D    nu.true <- rgamma(n, rho.true[true.s], rho.true[true.s])
##D    mu <- nu.true * exp(1 + x1 * b1.true[true.s])
##D    y <- rpois(n, mu)
##D 
##D    posterior <- HDPHSMMnegbin(y ~ x1, K = 10, verbose = 1000,
##D                           e = 2, f = 2, g = 10,
##D                           b0 = 0, B0 = 1/9,
##D                           a.omega = 1, b.omega = 100, r = 1,
##D                           rho.step = rep(0.75, times = 10),
##D                           seed = list(NA, 2),
##D                           omega.start = 0.05, gamma.start = 10,
##D                           alpha.start = 5)
##D 
##D    plotHDPChangepoint(posterior, ylab="Density", start=1)
##D    
## End(Not run)




