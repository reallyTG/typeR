library(bigtime)


### Name: sparseVARMA
### Title: Sparse Estimation of the Vector AutoRegressive Moving Average
###   (VARMA) Model
### Aliases: sparseVARMA

### ** Examples

data(Y)
VARMAfit <- sparseVARMA(Y) # sparse VARMA
y <- matrix(Y[,1], ncol=1)
ARMAfit <- sparseVARMA(y) # sparse ARMA



