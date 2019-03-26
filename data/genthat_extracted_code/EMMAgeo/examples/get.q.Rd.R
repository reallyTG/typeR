library(EMMAgeo)


### Name: get.q
### Title: Generate a parameter matrix with q.min and q.max values for
###   robust EMMA.
### Aliases: get.q
### Keywords: EMMA

### ** Examples

## load example data set
data(X, envir = environment())

## create parameter matrix
get.q(X = X, l = c(0, 0.05, 0.10, 0.15))



