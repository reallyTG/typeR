library(rms)


### Name: validate.rpart
### Title: Dxy and Mean Squared Error by Cross-validating a Tree Sequence
### Aliases: validate.rpart print.validate.rpart plot.validate.rpart
### Keywords: models tree category

### ** Examples

## Not run: 
##D n <- 100
##D set.seed(1)
##D x1 <- runif(n)
##D x2 <- runif(n)
##D x3 <- runif(n)
##D y  <- 1*(x1+x2+rnorm(n) > 1)
##D table(y)
##D require(rpart)
##D f <- rpart(y ~ x1 + x2 + x3, model=TRUE)
##D v <- validate(f)
##D v    # note the poor validation
##D par(mfrow=c(1,2))
##D plot(v, legendloc=c(.2,.5))
##D par(mfrow=c(1,1))
## End(Not run)



