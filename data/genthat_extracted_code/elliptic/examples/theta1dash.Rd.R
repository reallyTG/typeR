library(elliptic)


### Name: theta1dash
### Title: Derivatives of theta functions
### Aliases: theta1dash theta1dashdash theta1dashdashdash
### Keywords: math

### ** Examples

m <- 0.3+0.31i
z <- seq(from=1,to=2+1i,len=7)
delta <- 0.001
deriv.numer <- (theta1dashdash(z=z+delta,m=m) - theta1dashdash(z=z,m=m))/delta
deriv.exact <- theta1dashdashdash(z=z+delta/2,m=m)
abs(deriv.numer-deriv.exact)




