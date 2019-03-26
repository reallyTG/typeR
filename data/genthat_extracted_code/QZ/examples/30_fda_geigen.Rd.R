library(QZ)


### Name: fda.geigen
### Title: Generalized Eigen Analysis as in fda Package
### Aliases: fda.geigen
### Keywords: programming

### ** Examples

library(QZ, quiet = TRUE)

A <- matrix(as.double(1:6), 2)
B <- matrix(as.double(c(2, 1, 1, 2)), 2)
C <- diag(as.double(1:3))

ret.qz <- fda.geigen(A, B, C)

### Verify
library(fda, quiet = TRUE)
ret.fda <- fda::geigen(A, B, C)



