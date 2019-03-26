library(mixlink)


### Name: Numerical MLE
### Title: Numerical MLE
### Aliases: 'Numerical MLE' mle.mixlink.binom 'Numerical MLE'
###   mle.mixlink.binom.x 'Numerical MLE' mle.mixlink.pois 'Numerical MLE'
###   mle.mixlink.pois.x

### ** Examples

## Not run: 
##D   n <- 400
##D   mean.true <- rep(20, n)
##D   Pi.true <- c(1/5, 4/5)
##D   kappa.true <- 2
##D   y <- r.mixlink.pois(n, mean.true, Pi.true, kappa.true)
##D 
##D   mle.out <- mle.mixlink.pois(y, J = 2)
##D   coef(mle.out)
##D   print(mle.out)
##D   confint(mle.out)
## End(Not run)



