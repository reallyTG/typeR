library(Runuran)


### Name: unuran.cmv.new
### Title: Create a UNU.RAN continuous multivariate distribution object
### Aliases: unuran.cmv.new
### Keywords: distribution datagen

### ** Examples

## Get a distribution object with given pdf and mode
mvpdf <- function (x) { exp(-sum(x^2)) }
mvd <- unuran.cmv.new(dim=2, pdf=mvpdf, mode=c(0,0))

## Restrict domain to rectangle [0,1]x[0,1] and set
## mode to (0,0)
mvpdf <- function (x) { exp(-sum(x^2)) }
mvd <- unuran.cmv.new(dim=2, pdf=mvpdf, ll=c(0,0), ur=c(1,1), mode=c(0,0))




