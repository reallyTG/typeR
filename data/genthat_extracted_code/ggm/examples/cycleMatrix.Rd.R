library(ggm)


### Name: cycleMatrix
### Title: Fundamental cycles
### Aliases: cycleMatrix
### Keywords: graphs models multivariate

### ** Examples

## Three cycles
cycleMatrix(UG(~a*b*d+d*e+e*a*f))
## No cycle
 cycleMatrix(UG(~a*b))
## two cycles: the first is even and the second is odd
cm <- cycleMatrix(UG(~a*b+b*c+c*d+d*a+a*u*v))
apply(cm, 1, sum)



