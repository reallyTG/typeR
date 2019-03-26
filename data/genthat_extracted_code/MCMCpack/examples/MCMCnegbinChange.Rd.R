library(MCMCpack)


### Name: MCMCnegbinChange
### Title: Markov Chain Monte Carlo for Negative Binomial Regression
###   Changepoint Model
### Aliases: MCMCnegbinChange
### Keywords: models

### ** Examples


 ## Not run: 
##D    n <- 150
##D    reg <- 3
##D    true.s <- gl(reg, n/reg, n)
##D    rho.true <- c(1.5, 0.5, 3)
##D    b0.true <- c(1, 3, 1)
##D    b1.true <- c(1, -2, 2)
##D    x1 <- runif(n, 0, 2)
##D    nu.true <- rgamma(n, rho.true[true.s], rho.true[true.s])
##D    mu <- nu.true * exp(b0.true[true.s] + x1 * b1.true[true.s])
##D    y <- rpois(n, mu)
##D 
##D    posterior <- MCMCnegbinChange(y ~ x1, m = 2, verbose = 1000,
##D                           marginal.likelihood = "Chib95",
##D                           e = 2, f = 2, g = 10,
##D                           b0 = rep(0, 2), B0 = (1/9) * diag(2),
##D                           rho.step = rep(0.75, times = 3),
##D                           seed = list(NA, 2))
##D 
##D    par(mfrow=c(attr(posterior, "m") + 1, 1), mai=c(0.4, 0.6, 0.3, 0.05))
##D    plotState(posterior, legend.control = c(1, 0.6))
##D    plotChangepoint(posterior, verbose = TRUE, ylab="Density",
##D   start=1, overlay=TRUE)
##D 
##D 
##D    open.ended <- MCMCnegbinChange(y ~ x1, m = 10, verbose = 1000,
##D                           fixed.m = FALSE, mcmc = 2000, burnin = 2000,
##D                           e = 2, f = 2, g = 10,
##D                           a = 100, b = 1,
##D                           b0 = rep(0, 2), B0 = (1/9) * diag(2),
##D                           rho.step = 0.75,
##D                           seed = list(NA, 2))
##D 
##D    plotState(open.ended, legend.control = c(1, 0.6))
##D    
## End(Not run)




