library(BayesMed)


### Name: print.jzs_med
### Title: Print jzs_med output.
### Aliases: print.jzs_med

### ** Examples

## Not run: 
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
##D result <- jzs_med(independent=X,dependent=Y,mediator=M,SDmethod='dnorm')
##D 
##D # print result
##D result
## End(Not run)



