library(BayesMed)


### Name: plot.rjags
### Title: Plot the chains of the JAGS samples
### Aliases: plot.rjags

### ** Examples

## Not run: 
##D # simulate correlational data
##D X <- rnorm(50,0,1)
##D Y <- .3*X + rnorm(50,0,1)
##D 
##D # save jzs_cor output
##D res <- jzs_cor(X,Y)
##D 
##D # plot results
##D plot(res$jagssamples)
##D 
##D ############
##D 
##D # simulate mediational data
##D a <- .5 
##D b <- .6
##D t_prime <- .3
##D 
##D X <- rnorm(50,0,1)
##D M <- a*X + rnorm(50,0,1)
##D Y <- t_prime*X + b*M + rnorm(50,0,1)
##D 
##D # run jzs_med
##D res2 <- jzs_med(independent=X,dependent=Y,mediator=M)
##D 
##D # plot resulting chains for alpha, beta, and tau_prime
##D plot(res2$jagssamplesA)
##D plot(res2$jagssamplesTB)
## End(Not run)



