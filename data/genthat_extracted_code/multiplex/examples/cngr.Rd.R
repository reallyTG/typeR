library(multiplex)


### Name: cngr
### Title: Congruence Relations
### Aliases: cngr
### Keywords: algebra math cluster

### ** Examples

## Create an abstract semigroup object
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 1 ) )
#
S <- semigroup(arr)

## look at the congruences in S
cngr(S, PO=NULL)




