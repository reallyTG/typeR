library(pdSpecEst)


### Name: pdPolynomial
### Title: Generate intrinsic HPD polynomial curves
### Aliases: pdPolynomial

### ** Examples

## First-order polynomial
p0 <- diag(3) ## HPD starting point
v0 <- array(H.coeff(rnorm(9), inverse = TRUE), dim = c(3, 3, 1)) ## zero-th order cov. derivative
P.poly <- pdPolynomial(p0, v0)

## First-order polynomials coincide with geodesic curves
P.geo <- sapply(seq(0, 1, length = 100), function(t) Expm(p0, t * Logm(p0, P.poly[, , 100])),
               simplify = "array")
all.equal(P.poly, P.geo)




