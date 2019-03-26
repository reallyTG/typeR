library(MatrixCorrelation)


### Name: r1
### Title: Correlational Measures for Matrices
### Aliases: r1 r2 r3 r4 r2 r3 r4 GCD

### ** Examples

X1  <- matrix(rnorm(100*300),100,300)
usv <- svd(X1)
X2  <- usv$u[,-3] %*% diag(usv$d[-3]) %*% t(usv$v[,-3])

r1(X1,X2)
r2(X1,X2)
r3(X1,X2)
r4(X1,X2)
GCD(X1,X2)
GCD(X1,X2, 5,5)




