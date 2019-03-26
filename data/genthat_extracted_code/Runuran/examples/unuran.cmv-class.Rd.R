library(Runuran)


### Name: unuran.cmv-class
### Title: Class "unuran.cmv" for Continuous Multivariate Distribution
### Aliases: unuran.cmv-class print,unuran.cmv-method
###   show,unuran.cmv-method initialize,unuran.cmv-method
### Keywords: classes distribution datagen

### ** Examples

## Create distribution with given PDF
mvpdf <- function (x) { exp(-sum(x^2)) }
mvdist <- new("unuran.cmv", dim=2, pdf=mvpdf)

## Restrict domain to rectangle [0,1]x[0,1] and set
## mode to (0,0)
mvpdf <- function (x) { exp(-sum(x^2)) }
mvdist <- new("unuran.cmv", dim=2, pdf=mvpdf, ll=c(0,0), ur=c(1,1), mode=c(0,0))




