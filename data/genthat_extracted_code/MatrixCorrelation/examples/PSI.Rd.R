library(MatrixCorrelation)


### Name: PSI
### Title: Procrustes Similarity Index
### Aliases: PSI

### ** Examples

X1  <- scale( matrix( rnorm(100*300), 100,300), scale = FALSE)
usv <- svd(X1)
X2  <- usv$u[,-3] %*% diag(usv$d[-3]) %*% t(usv$v[,-3])
PSI(X1,X2)




