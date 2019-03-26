library(BayesMed)


### Name: plot.JZSMed
### Title: Display the results of 'jzs_med' in a figure.
### Aliases: plot.JZSMed

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
##D # save jzs_med output
##D res <- jzs_med(independent=X,dependent=Y,mediator=M)
##D 
##D # plot results
##D plot(res$main_result)
## End(Not run)



