library(gsl)


### Name: Poly
### Title: Polynomials
### Aliases: Poly poly gsl_poly
### Keywords: array

### ** Examples

a <- matrix(1:4,2,2)
rownames(a) <- letters[1:2]
(jj <- gsl_poly(1:3,a))

jj-(1 + 2*a + 3*a^2)  #should be small



