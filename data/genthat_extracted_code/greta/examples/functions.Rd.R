library(greta)


### Name: functions
### Title: functions for greta arrays
### Aliases: functions

### ** Examples

## Not run: 
##D 
##D x <- as_data(matrix(1:9, nrow = 3, ncol = 3))
##D a <- log(exp(x))
##D b <- log1p(expm1(x))
##D c <- sign(x - 5)
##D d <- abs(x - 5)
##D 
##D z <- t(a)
##D 
##D y <- sweep(x, 1, e, '-')
## End(Not run)



