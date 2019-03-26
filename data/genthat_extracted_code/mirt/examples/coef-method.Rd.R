library(mirt)


### Name: coef-method
### Title: Extract raw coefs from model object
### Aliases: coef-method coef,SingleGroupClass-method
###   coef,MultipleGroupClass-method coef,MixedClass-method
###   coef,DiscreteClass-method coef,MixtureClass-method

### ** Examples


## Not run: 
##D dat <- expand.table(LSAT7)
##D x <- mirt(dat, 1)
##D coef(x)
##D coef(x, IRTpars = TRUE)
##D coef(x, simplify = TRUE)
##D 
##D #with computed information matrix
##D x <- mirt(dat, 1, SE = TRUE)
##D coef(x)
##D coef(x, printSE = TRUE)
##D coef(x, as.data.frame = TRUE)
##D 
##D #two factors
##D x2 <- mirt(Science, 2)
##D coef(x2)
##D coef(x2, rotate = 'varimax')
##D 
## End(Not run)



