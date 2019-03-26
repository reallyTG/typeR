library(MatrixCorrelation)


### Name: RV
### Title: RV coefficients
### Aliases: RV RV2 RVadj RVadjMaye RVadjGhaziri RV2 RVadjMaye RVadjGhaziri
###   RVadj

### ** Examples

X1  <- matrix(rnorm(100*300),100,300)
usv <- svd(X1)
X2  <- usv$u[,-3] %*% diag(usv$d[-3]) %*% t(usv$v[,-3])

RV(X1,X2)
RV2(X1,X2)
RVadj(X1,X2)




