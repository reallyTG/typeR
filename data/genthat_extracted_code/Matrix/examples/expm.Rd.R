library(Matrix)


### Name: expm
### Title: Matrix Exponential
### Aliases: expm expm,Matrix-method expm,dMatrix-method
###   expm,dgeMatrix-method expm,triangularMatrix-method
###   expm,symmetricMatrix-method expm,ddiMatrix-method expm,matrix-method
### Keywords: algebra math

### ** Examples

(m1 <- Matrix(c(1,0,1,1), nc = 2))
(e1 <- expm(m1)) ; e <- exp(1)
stopifnot(all.equal(e1@x, c(e,0,e,e), tolerance = 1e-15))
(m2 <- Matrix(c(-49, -64, 24, 31), nc = 2))
(e2 <- expm(m2))
(m3 <- Matrix(cbind(0,rbind(6*diag(3),0))))# sparse!
(e3 <- expm(m3)) # upper triangular



