library(MCMCpack)


### Name: MCMCoprobit
### Title: Markov Chain Monte Carlo for Ordered Probit Regression
### Aliases: MCMCoprobit
### Keywords: models

### ** Examples


   ## Not run: 
##D    x1 <- rnorm(100); x2 <- rnorm(100);
##D    z <- 1.0 + x1*0.1 - x2*0.5 + rnorm(100);
##D    y <- z; y[z < 0] <- 0; y[z >= 0 & z < 1] <- 1;
##D    y[z >= 1 & z < 1.5] <- 2; y[z >= 1.5] <- 3;
##D    out1 <- MCMCoprobit(y ~ x1 + x2, tune=0.3)
##D    out2 <- MCMCoprobit(y ~ x1 + x2, tune=0.3, tdf=3, verbose=1000, mcmc.method="AC")
##D    summary(out1)
##D    summary(out2)
##D    plot(out1)
##D    plot(out2)
##D    
## End(Not run)




