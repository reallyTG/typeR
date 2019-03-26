library(MatrixCorrelation)


### Name: allCorrelations
### Title: All correlations
### Aliases: allCorrelations

### ** Examples

X1  <- scale( matrix( rnorm(100*300), 100,300), scale = FALSE)
usv <- svd(X1)
X2  <- usv$u[,-3] %*% diag(usv$d[-3]) %*% t(usv$v[,-3])

allCorrelations(X1,X2, ncomp1 = 5,ncomp2 = 5)




