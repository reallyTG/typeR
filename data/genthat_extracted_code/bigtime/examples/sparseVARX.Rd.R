library(bigtime)


### Name: sparseVARX
### Title: Sparse Estimation of the Vector AutoRegressive with Exogenous
###   Variables X (VARX) Model
### Aliases: sparseVARX

### ** Examples

data(Y)
data(X)
VARXfit <- sparseVARX(Y=Y, X=X) # sparse VARX
y <- matrix(Y[,1], ncol=1)
ARXfit <- sparseVARX(Y=y, X=X) # sparse ARX



