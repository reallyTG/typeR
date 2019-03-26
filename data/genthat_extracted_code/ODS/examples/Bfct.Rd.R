library(ODS)


### Name: Bfct
### Title: power basis functions of a spline of given degree
### Aliases: Bfct

### ** Examples

library(ODS)

x <- matrix(c(1,2,3,4,5),ncol=1)
degree <- 2
knots <- c(1,3,4)

Bfct(x, degree, knots)



