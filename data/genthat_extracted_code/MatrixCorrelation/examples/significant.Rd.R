library(MatrixCorrelation)


### Name: significant
### Title: Significance estimation for Similarity of Matrices Index (SMI)
### Aliases: significant

### ** Examples

X1  <- scale( matrix( rnorm(100*300), 100,300), scale = FALSE)
usv <- svd(X1)
X2  <- usv$u[,-3] %*% diag(usv$d[-3]) %*% t(usv$v[,-3])

(smi <- SMI(X1,X2,5,5))
significant(smi, B = 1000) # default B = 10000




