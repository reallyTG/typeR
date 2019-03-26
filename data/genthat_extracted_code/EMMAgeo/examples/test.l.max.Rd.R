library(EMMAgeo)


### Name: test.l.max
### Title: Function to find maximum possible l value.
### Aliases: test.l.max
### Keywords: EMMA

### ** Examples

## load example data set
data(X, envir = environment())

## create weight transformation limits vector
l <- seq(from = 0, to = 0.6, by = 0.02)

## test l.max
l.max <- test.l.max(X = X)



