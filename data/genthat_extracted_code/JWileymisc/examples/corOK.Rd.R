library(JWileymisc)


### Name: corOK
### Title: Return a non-missing correlation matrix
### Aliases: corOK
### Keywords: utils

### ** Examples

cormat <- cor(iris[, -5])
# set missing
cormat[cbind(c(1,2), c(2,1))] <- NA

# print
cormat

# return complete
corOK(cormat)

# using maximum iterations
corOK(cormat, maxiter=0)

# clean up
rm(cormat)



