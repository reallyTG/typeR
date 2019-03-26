library(madness)


### Name: numderiv
### Title: Numerical (approximate) Differentiation.
### Aliases: numderiv numderiv,ANY,array-method ANY,array-method
###   numderiv,ANY,madness-method ANY,madness-method

### ** Examples

f <- function(x,h) {
  cos(x + h)
}
x <- array(rnorm(100),dim=c(10,10))
madx <- numderiv(f,x,1e-8,h=pi)



