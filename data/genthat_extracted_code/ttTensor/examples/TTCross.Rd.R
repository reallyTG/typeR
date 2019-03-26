library(ttTensor)


### Name: TTCross
### Title: Tensor-Train Decomposition by TRCross
### Aliases: TTCross
### Keywords: methods

### ** Examples

library("rTensor")
library("tensorr")
# Sparse Tensor data
X1 <- array(rnorm(3*5*7*9*11), c(3,5,7,9,11))
dimnames(X1) <- list(
    I=paste0("i", 1:3),
    J=paste0("j", 1:5),
    K=paste0("k", 1:7),
    L=paste0("l", 1:9),
    M=paste0("m", 1:11)
    )
X1 <- as.tensor(X1)
X2 <- as_sptensor(dtensor(X1@data))
dimnames(X2) <- dimnames(X1@data)
# TT-ranks
Ranks <- c(p=2, q=4, r=6, s=8)
# TT-Cross
out.TTCross <- TTCross(X2, Ranks, num.iter=2)



