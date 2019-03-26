library(multiplex)


### Name: multiplex-package
### Title: Algebraic Tools for the Analysis of Multiple Social Networks
### Aliases: multiplex-package
### Keywords: models attribute manip IO data file

### ** Examples

## Create the data: two binary relations among three elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 3 ) )

## Dichotomize it with customized cutoff value
dichot(arr, c = 3)

## preview
prev(arr)

## create the semigroup (elay...)
semigroup(arr)

## and look at the strings
strings(arr)




