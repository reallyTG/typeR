library(qkerntool)


### Name: qkernmatrix
### Title: qKernel Matrix functions
### Aliases: qkernmatrix qkernmatrix,qkernel-method
###   qkernmatrix,rbfqkernel-method qkernmatrix,nonlqkernel-method
###   qkernmatrix,laplqkernel-method qkernmatrix,ratiqkernel-method
###   qkernmatrix,multqkernel-method qkernmatrix,invqkernel-method
###   qkernmatrix,wavqkernel-method qkernmatrix,powqkernel-method
###   qkernmatrix,logqkernel-method qkernmatrix,cauqkernel-method
###   qkernmatrix,chiqkernel-method qkernmatrix,studqkernel-method
###   qkernmatrix.rbfqkernel qkernmatrix.nonlqkernel
###   qkernmatrix.laplqkernel qkernmatrix.ratiqkernel
###   qkernmatrix.multqkernel qkernmatrix.invqkernel qkernmatrix.wavqkernel
###   qkernmatrix.powqkernel qkernmatrix.logqkernel qkernmatrix.cauqkernel
###   qkernmatrix.chiqkernel qkernmatrix.studqkernel
### Keywords: algebra array

### ** Examples


data(iris)
dt <- as.matrix(iris[ ,-5])

## initialize kernel function
rbf <- rbfbase(sigma = 1.4, q=0.8)
rbf

## calculate qkernel matrix
qkernmatrix(rbf, dt)





