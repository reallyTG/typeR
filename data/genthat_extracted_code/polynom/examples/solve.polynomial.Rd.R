library(polynom)


### Name: solve.polynomial
### Title: Zeros of a Polynomial
### Aliases: solve.polynomial
### Keywords: symbolmath

### ** Examples

p <- polynomial(6:1)
p
## 6 + 5*x + 4*x^2 + 3*x^3 + 2*x^4 + x^5 
pz <- solve(p)
pz
## [1] -1.49180+0.0000i -0.80579-1.2229i -0.80579+1.2229i
## [4]  0.55169-1.2533i  0.55169+1.2533i
## To retrieve the original polynomial from the zeros:
poly.calc(pz)
## Warning: imaginary parts discarded in coercion
## 6 + 5*x + 4*x^2 + 3*x^3 + 2*x^4 + x^5



