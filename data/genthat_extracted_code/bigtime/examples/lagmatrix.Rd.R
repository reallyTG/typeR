library(bigtime)


### Name: lagmatrix
### Title: Creates Lagmatrix of Estimated Coefficients
### Aliases: lagmatrix

### ** Examples

data(Y)
data(X)
VARXfit <- sparseVARX(Y=Y, X=X) # sparse VARX
Lhats <- lagmatrix(fit=VARXfit, model="VARX")



