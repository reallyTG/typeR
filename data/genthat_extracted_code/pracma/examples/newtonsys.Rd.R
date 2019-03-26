library(pracma)


### Name: newtonsys
### Title: Newton Method for Nonlinear Systems
### Aliases: newtonsys
### Keywords: math

### ** Examples

##  Example from Quarteroni & Saleri
F1 <- function(x) c(x[1]^2 + x[2]^2 - 1, sin(pi*x[1]/2) + x[2]^3)
newtonsys(F1, x0 = c(1, 1))  # zero: 0.4760958 -0.8793934

##  Find the roots of the complex function sin(z)^2 + sqrt(z) - log(z)
F2 <- function(x) {
    z  <- x[1] + x[2]*1i
    fz <- sin(z)^2 + sqrt(z) - log(z)
    c(Re(fz), Im(fz))
}
newtonsys(F2, c(1, 1))
# $zero   0.2555197 0.8948303 , i.e.  z0 = 0.2555 + 0.8948i
# $fnorm  2.220446e-16
# $niter  8

##  Two more problematic examples
F3 <- function(x)
        c(2*x[1] - x[2] - exp(-x[1]), -x[1] + 2*x[2] - exp(-x[2]))
newtonsys(F3, c(0, 0))
# $zero   0.5671433 0.5671433
# $fnorm  0
# $niter  4

## Not run: 
##D F4 <- function(x)  # Dennis Schnabel
##D         c(x[1]^2 + x[2]^2 - 2, exp(x[1] - 1) + x[2]^3 - 2)
##D newtonsys(F4, c(2.0, 0.5))
##D # will result in an error ``missing value in  ... err<tol && niter<maxiter''
## End(Not run)



