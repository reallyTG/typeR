library(EMMAgeo)


### Name: model.em
### Title: Model all possible end-member scenarios.
### Aliases: model.em
### Keywords: EMMA

### ** Examples

## load example data set
data(X, envir = environment())

## define input parameters
l <- c(0, 0.05, 0.10)
q <- cbind(c(2, 2, 3), c(5, 6, 4))

## infer l-vector
em_pot <- model.em(X = X, q = q, l = l)



