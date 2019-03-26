library(multiplex)


### Name: semiring
### Title: Semiring Structures for Balance Theory
### Aliases: semiring
### Keywords: algebra math models

### ** Examples

## Create the data: two sets with a pair of binary relations 
## among three elements
arr <- round( replace( array( runif(18), c(3 ,3, 2) ), array( runif(18),
       c(3, 3, 2) ) > .5, 3 ) )

## Make the signed matrix with two types of relations
sg <- signed(arr)

## Establish the semiring structure
semiring(sg)




