library(polynom)


### Name: deriv.polynomial
### Title: Differentiate a Polynomial
### Aliases: deriv.polynomial
### Keywords: symbolmath

### ** Examples

pr <- poly.calc(1:5)
pr
## -120 + 274*x - 225*x^2 + 85*x^3 - 15*x^4 + x^5
deriv(pr)
##  274 - 450*x + 255*x^2 - 60*x^3 + 5*x^4



