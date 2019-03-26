library(multiplex)


### Name: semigroup
### Title: Constructing the Semigroup of Relations
### Aliases: semigroup
### Keywords: algebra math

### ** Examples

## Create the data: 2 binary relations among 3 elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 1 ) )

## optional: put labels
dimnames(arr)[[3]] <- list("n", "m")

## look at the semigroup
semigroup(arr)




