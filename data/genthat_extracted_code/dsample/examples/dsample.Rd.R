library(dsample)


### Name: dsample
### Title: Random Samples Generation Through The Wang-Lee and Fu-Wang
###   Algorithms
### Aliases: dsample
### Keywords: discretization sampling,

### ** Examples

## The following example is taken from West (1993, page 414).
## West, M. (1993). Approximating posterior distributions by mixture.
##   Journal of the Royal Statistical Society - B, 55, 409-422.

expr <- expression((x1*(1-x2))^5 * (x2*(1-x1))^3 * (1-x1*(1-x2)-x2*(1-x1))^37)
sets <- list(x1=runif(1e5), x2=runif(1e5))
smp <- dsample(expr=expr, rpmat=sets, nk=1e4, n=1e3)

##
## More accurate results can be achieved by increasing the number
## of dicretization points and the number of contours.



