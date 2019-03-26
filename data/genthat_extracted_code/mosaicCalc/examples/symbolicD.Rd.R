library(mosaicCalc)


### Name: symbolicD
### Title: Symbolic Derivatives
### Aliases: symbolicD

### ** Examples

symbolicD( a*x^2 ~ x)
symbolicD( a*x^2 ~ x&x)
symbolicD( a*sin(x)~x, .order=4)
symbolicD( a*x^2*y+b*y ~ x, a=10, b=100 )



