library(QZ)


### Name: Generalized Eigenvalues
### Title: Generalized Eigen Values
### Aliases: geigen qz.geigen
### Keywords: programming

### ** Examples

library(QZ, quiet = TRUE)

### http://www.nag.com/lapack-ex/node122.html
(ret <- qz.geigen(exAB1$A, exAB1$B))

### http://www.nag.com/lapack-ex/node117.html
(ret <- qz.geigen(exAB2$A, exAB2$B))

### http://www.nag.com/lapack-ex/node92.html
(ret <- qz.geigen(exA1$A))

### http://www.nag.com/lapack-ex/node87.html
(ret <- qz.geigen(exA2$A))



