library(GoFKernel)


### Name: inverse
### Title: Inverse CDF Function
### Aliases: inverse
### Keywords: ~kwd1 ~kwd2

### ** Examples

f <- function(x) pbeta(x, shape1=2, shape2=3)
f.inv <- inverse(f,lower=0,upper=1)
f.inv(.2)



