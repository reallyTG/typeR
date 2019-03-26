library(bigtime)


### Name: sparseVAR
### Title: Sparse Estimation of the Vector AutoRegressive (VAR) Model
### Aliases: sparseVAR

### ** Examples

data(Y)
VARfit <- sparseVAR(Y) # sparse VAR
y <- matrix(Y[,1], ncol=1)
ARfit <- sparseVAR(y) # sparse AR



