library(KERE)


### Name: kernelMatrix
### Title: Kernel Matrix functions
### Aliases: kernelMatrix kernelMult kernelPol kernelFast
###   kernelPol,kernel-method kernelMatrix,kernel-method
###   kernelMult,kernel-method kernelFast,kernel-method
###   kernelMatrix,rbfkernel-method kernelMatrix,polykernel-method
###   kernelMatrix,vanillakernel-method kernelMatrix,tanhkernel-method
###   kernelMatrix,laplacekernel-method kernelMatrix,anovakernel-method
###   kernelMatrix,splinekernel-method kernelMatrix,besselkernel-method
###   kernelMult,rbfkernel,ANY-method kernelMult,splinekernel,ANY-method
###   kernelMult,polykernel,ANY-method kernelMult,tanhkernel,ANY-method
###   kernelMult,laplacekernel,ANY-method
###   kernelMult,besselkernel,ANY-method kernelMult,anovakernel,ANY-method
###   kernelMult,vanillakernel,ANY-method
###   kernelMult,character,kernelMatrix-method kernelPol,rbfkernel-method
###   kernelPol,splinekernel-method kernelPol,polykernel-method
###   kernelPol,tanhkernel-method kernelPol,vanillakernel-method
###   kernelPol,anovakernel-method kernelPol,besselkernel-method
###   kernelPol,laplacekernel-method kernelFast,rbfkernel-method
###   kernelFast,splinekernel-method kernelFast,polykernel-method
###   kernelFast,tanhkernel-method kernelFast,vanillakernel-method
###   kernelFast,anovakernel-method kernelFast,besselkernel-method
###   kernelFast,laplacekernel-method kernelFast,splinekernel-method
### Keywords: algebra array

### ** Examples

## use the spam data
x <- matrix(rnorm(10*10),10,10)

## initialize kernel function 
rbf <- rbfdot(sigma = 0.05)
rbf

## calculate kernel matrix
kernelMatrix(rbf, x)

y <- matrix(rnorm(10*1),10,1)


## calculate the quadratic kernel expression
kernelPol(rbf, x, ,y)

## calculate the kernel expansion
kernelMult(rbf, x, ,y)



