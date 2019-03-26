library(multiplex)


### Name: mnplx
### Title: Make a multiple network as monoplex structure
### Aliases: mnplx
### Keywords: manip array

### ** Examples

## Create the data: 2 binary relations among 3 elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 1 ) )

## Make it monoplex
mnplx(arr)




