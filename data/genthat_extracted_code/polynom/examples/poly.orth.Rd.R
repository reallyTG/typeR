library(polynom)


### Name: poly.orth
### Title: Construct Orthogonal Polynomials
### Aliases: poly.orth
### Keywords: symbolmath

### ** Examples

x <- rep(1:4, 1:4)		# x with repetitions for weighting
x
## [1] 1 2 2 3 3 3 4 4 4 4
polx <- poly.orth(x, 3)		# calculate orthogonal polynomials
polx
## List of polynomials:
## [[1]]
## 0.3162278 
## 
## [[2]]
## -0.9486833 + 0.3162278*x 
## 
## [[3]]
## 2.139203 - 1.863177*x + 0.3450328*x^2 
## 
## [[4]]
## -5.831564 + 8.80369*x - 3.803194*x^2 + 0.4930066*x^3 
v <- sapply(polx, predict, x)   # orthonormal basis
round(crossprod(v), 10)	        # check orthonormality



