library(pracma)


### Name: broyden
### Title: Broyden's Method
### Aliases: broyden
### Keywords: math

### ** Examples

##  Example from Quarteroni & Saleri
F1 <- function(x) c(x[1]^2 + x[2]^2 - 1, sin(pi*x[1]/2) + x[2]^3)
broyden(F1, x0 = c(1, 1))
# zero: 0.4760958 -0.8793934; fnorm: 9.092626e-09; niter: 13

F <- function(x) {
    x1 <- x[1]; x2 <- x[2]; x3 <- x[3]
    as.matrix(c(x1^2 + x2^2 + x3^2 - 1,
                x1^2 + x3^2 - 0.25,
                x1^2 + x2^2 - 4*x3), ncol = 1)
}
x0 <- as.matrix(c(1, 1, 1))
broyden(F, x0)
# zero: 0.4407629 0.8660254 0.2360680; fnorm: 1.34325e-08; niter: 8

##  Find the roots of the complex function sin(z)^2 + sqrt(z) - log(z)
F2 <- function(x) {
    z  <- x[1] + x[2]*1i
    fz <- sin(z)^2 + sqrt(z) - log(z)
    c(Re(fz), Im(fz))
}
broyden(F2, c(1, 1))
# zero   0.2555197 0.8948303 , i.e.  z0 = 0.2555 + 0.8948i
# fnorm  7.284374e-10
# niter  13

##  Two more problematic examples
F3 <- function(x)
        c(2*x[1] - x[2] - exp(-x[1]), -x[1] + 2*x[2] - exp(-x[2]))
broyden(F3, c(0, 0))
# $zero   0.5671433 0.5671433   # x = exp(-x)

F4 <- function(x)   # Dennis Schnabel
        c(x[1]^2 + x[2]^2 - 2, exp(x[1] - 1) + x[2]^3 - 2)
broyden(F4, c(2.0, 0.5), maxiter = 100)



