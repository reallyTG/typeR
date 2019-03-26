library(multiplex)


### Name: fact
### Title: Factorisation of semigroup structures
### Aliases: fact
### Keywords: algebra math

### ** Examples

## Create a partially ordered semigroup
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 1 ) )
# semigroup
S <- semigroup(arr)
# string relations
St <- strings(arr)
# partial order
P <- partial.order(St)

## Perform the factorisation of PO S
fact(S, P)



