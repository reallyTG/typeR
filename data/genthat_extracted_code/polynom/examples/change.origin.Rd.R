library(polynom)


### Name: change.origin
### Title: Change Origin for a Polynomial
### Aliases: change.origin
### Keywords: symbolmath

### ** Examples

pr <- poly.calc(1:5)
pr
## -120 + 274*x - 225*x^2 + 85*x^3 - 15*x^4 + x^5
change.origin(pr, 3)
## 4*x - 5*x^3 + x^5



