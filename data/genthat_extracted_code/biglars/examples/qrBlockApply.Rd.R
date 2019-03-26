library(biglars)


### Name: qrBlockApply
### Title: Blockwise Cholesky Factorization
### Aliases: qrBlockApply qrBlock
### Keywords: regression

### ** Examples


data(diabetes)

qrx <- qr(diabetes$x)

list(R = qr.R(qrx), Qty = crossprod(qr.Q(qrx), diabetes$y))

qrBlockApply( diabetes$x, diabetes$y, blockSize = 34)



