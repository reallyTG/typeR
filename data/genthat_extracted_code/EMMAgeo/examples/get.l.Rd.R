library(EMMAgeo)


### Name: get.l
### Title: Generate a vector of weight transformation values from l_min to
###   l_max.
### Aliases: get.l
### Keywords: EMMA

### ** Examples

## load example data set
data(X, envir = environment())

## infer l-vector
l <- get.l(X = X, n = 5, max = 0.8, min = 0.02)



