library(polynom)


### Name: integral.polynomial
### Title: Integrate a Polynomial
### Aliases: integral integral.polynomial
### Keywords: symbolmath

### ** Examples

p <- poly.calc(1:5)
p
## -120 + 274*x - 225*x^2 + 85*x^3 - 15*x^4 + x^5
deriv(p)
## 274 - 450*x + 255*x^2 - 60*x^3 + 5*x^4
integral(deriv(p)) - 120
## -120 + 274*x - 225*x^2 + 85*x^3 - 15*x^4 + x^5



