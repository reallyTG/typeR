library(Runuran)


### Name: unuran.cont-class
### Title: Class "unuran.cont" for Continuous Distribution
### Aliases: unuran.cont-class print,unuran.cont-method
###   show,unuran.cont-method initialize,unuran.cont-method
### Keywords: classes distribution datagen

### ** Examples

## Create continuous distribution with given logPDF and its derivative
pdf <- function (x) { -0.5*x^2 }
dpdf <- function (x) { -x }
distr <- new("unuran.cont", pdf=pdf, dpdf=dpdf, islog=TRUE, lb=-Inf, ub=Inf)




