library(pracma)


### Name: complexstep
### Title: Complex Step Derivatives
### Aliases: complexstep grad_csd jacobian_csd hessian_csd laplacian_csd
### Keywords: math

### ** Examples

##  Example from Martins et al.
f <- function(x) exp(x)/sqrt(sin(x)^3 + cos(x)^3)  # derivative at x0 = 1.5
# central diff formula    # 4.05342789402801, error 1e-10
# numDeriv::grad(f, 1.5)  # 4.05342789388197, error 1e-12  Richardson
# pracma::numderiv        # 4.05342789389868, error 5e-14  Richardson
complexstep(f, 1.5)       # 4.05342789389862, error 1e-15
# Symbolic calculation:   # 4.05342789389862

jacobian_csd(f, 1.5)

f1 <- function(x) sum(sin(x))
grad_csd(f1, rep(2*pi, 3))
## [1] 1 1 1

laplacian_csd(f1, rep(pi/2, 3))
## [1] -3

f2 <- function(x) c(sin(x[1]) * exp(-x[2]))
hessian_csd(f2, c(0.1, 0.5, 0.9))
##             [,1]        [,2] [,3]
## [1,] -0.06055203 -0.60350053    0
## [2,] -0.60350053  0.06055203    0
## [3,]  0.00000000  0.00000000    0

f3 <- function(u) {
    x <- u[1]; y <- u[2]; z <- u[3]
    matrix(c(exp(x^+y^2), sin(x+y), sin(x)*cos(y), x^2 - y^2), 2, 2)
  }
jacobian_csd(f3, c(1,1,1))
##            [,1]       [,2] [,3]
## [1,]  2.7182818  0.0000000    0
## [2,] -0.4161468 -0.4161468    0
## [3,]  0.2919266 -0.7080734    0
## [4,]  2.0000000 -2.0000000    0



