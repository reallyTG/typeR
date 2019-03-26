library(polynom)


### Name: as.function.polynomial
### Title: Coerce a Polynomial to a Function
### Aliases: as.function.polynomial
### Keywords: symbolmath

### ** Examples

pr <- (poly.calc(-1:1) - 2 * polynomial(c(1, 2, 1)))^2
pr
## 4 + 20*x + 33*x^2 + 16*x^3 - 6*x^4 - 4*x^5 + x^6
prf <- as.function(pr)
prf
## function (x) 
## 4 + x * (20 + x * (33 + x * (16 + x * (-6 + x * (-4 + x * (1))))))
## <environment: 0x402440f0>
prf(-3:3)
##  1024 64  0 4 64 144 64
predict(pr, -3:3)
##  1024 64  0 4 64 144 64



