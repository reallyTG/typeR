library(bestNormalize)


### Name: bestNormalize
### Title: Calculate and perform best normalizing transformation
### Aliases: bestNormalize predict.bestNormalize print.bestNormalize

### ** Examples


x <- rgamma(100, 1, 1)

## Not run: 
##D # With Repeated CV
##D BN_obj <- bestNormalize(x)
##D BN_obj
##D p <- predict(BN_obj)
##D x2 <- predict(BN_obj, newdata = p, inverse = TRUE)
##D 
##D all.equal(x2, x)
## End(Not run)


## Not run: 
##D # With leave-one-out CV
##D BN_obj <- bestNormalize(x, loo = TRUE)
##D BN_obj
##D p <- predict(BN_obj)
##D x2 <- predict(BN_obj, newdata = p, inverse = TRUE)
##D 
##D all.equal(x2, x)
## End(Not run)

# Without CV
BN_obj <- bestNormalize(x, allow_orderNorm = FALSE, out_of_sample = FALSE)
BN_obj
p <- predict(BN_obj)
x2 <- predict(BN_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)





