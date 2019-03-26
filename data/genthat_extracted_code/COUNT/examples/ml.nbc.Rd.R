library(COUNT)


### Name: ml.nbc
### Title: NBC: maximum likelihood linear negative binomial regression
### Aliases: ml.nbc
### Keywords: models

### ** Examples

# Table 10.12, Hilbe. J.M. (2011), Negative Binomial Regression, 
#   2nd ed. Cambridge University Press (adapted)

## Not run: 
##D data(medpar)
##D nobs <- 50000
##D x2 <- runif(nobs)
##D x1 <- runif(nobs)
##D xb <- 1.25*x1 + .1*x2 - 1.5
##D mu <- 1/(exp(-xb)-1)
##D p <- 1/(1+mu)
##D r <- 1
##D gcy <- rnbinom(nobs, size=r, prob = p)
##D test <- data.frame(gcy, x1, x2)
##D nbc <- ml.nbc(gcy ~ x1 + x2, data=test)
##D nbc
## End(Not run)



