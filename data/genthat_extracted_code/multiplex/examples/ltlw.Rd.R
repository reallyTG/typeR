library(multiplex)


### Name: ltlw
### Title: First- and Last Letter Laws
### Aliases: ltlw
### Keywords: algebra math

### ** Examples

## Create the data: 3 binary relations among 3 elements
arr <- round( replace( array(runif(27), c(3,3,3)), array(runif(27),
       c(3,3,3))>.75, 1 ) )

## Put labels
dimnames(arr)[[3]] <- list("n","m","ñ")

## Construct the semigroup
S <- semigroup(arr, type="symbolic")

## Find the Letter Laws
ltlw(S)



