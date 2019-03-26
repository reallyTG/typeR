library(BayesMed)


### Name: plot.CI
### Title: Plot the posterior distribution of the indirect effect
###   alpha*beta
### Aliases: plot.CI

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
##D res <- jzs_med(independent=X,dependent=Y,mediator=M)
##D 
##D # plot posterior distribution of a*b
##D plot(res$ab_samples)
##D 
##D # print the exact lower and upper boundary of the interval
##D res$CI_ab
## End(Not run)



