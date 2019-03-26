library(bestNormalize)


### Name: lambert
### Title: Lambert W x F Normalization
### Aliases: lambert predict.lambert print.lambert

### ** Examples

## Not run: 
##D x <- rgamma(100, 1, 1)
##D 
##D lambert_obj <- lambert(x)
##D lambert_obj
##D p <- predict(lambert_obj)
##D x2 <- predict(lambert_obj, newdata = p, inverse = TRUE)
##D 
##D all.equal(x2, x)
## End(Not run)




