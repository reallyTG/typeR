library(multiplex)


### Name: dichot
### Title: Dichotomize data with a cutoff
### Aliases: dichot
### Keywords: manip

### ** Examples

## Create the data: 2 binary relations among 3 elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 3 ) )

## dichotomize it with a cutoff value of 2
dichot(arr, c = 2)



