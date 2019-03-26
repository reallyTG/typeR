library(FrF2)


### Name: FrF2Large
### Title: Function to provide large (at least 8192 runs) regular
###   Fractional Factorial designs that are not necessarily optimal,
###   especially large resolution V designs.
### Aliases: FrF2Large nrunsV
### Keywords: array design

### ** Examples

## numbers of runs needed for resolution V designs in different numbers of factors 
nrunsV(8)
nrunsV(18)
needed <- nrunsV(27)
needed
nrunsV(65)
nrunsV(71)

## Not run: 
##D plan <- FrF2Large(nrunsV(75),75)
##D summary(plan)
## End(Not run)



