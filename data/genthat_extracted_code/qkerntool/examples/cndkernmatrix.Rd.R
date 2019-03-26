library(qkerntool)


### Name: cndkernmatrix
### Title: CND Kernel Matrix functions
### Aliases: cndkernmatrix cndkernmatrix,cndkernel-method
###   cndkernmatrix,anokernel-method cndkernmatrix,caukernel-method
###   cndkernmatrix,chikernel-method cndkernmatrix,invkernel-method
###   cndkernmatrix,laplkernel-method cndkernmatrix,logkernel-method
###   cndkernmatrix,multkernel-method cndkernmatrix,nonlkernel-method
###   cndkernmatrix,powkernel-method cndkernmatrix,ratikernel-method
###   cndkernmatrix,studkernel-method cndkernmatrix,wavkernel-method
###   cndkernmatrix,polykernel-method cndkernmatrix,rbfkernel-method
###   cndkernmatrix.anokernel cndkernmatrix.caukernel
###   cndkernmatrix.chikernel cndkernmatrix.invkernel
###   cndkernmatrix.laplkernel cndkernmatrix.logkernel
###   cndkernmatrix.multkernel cndkernmatrix.nonlkernel
###   cndkernmatrix.polykernel cndkernmatrix.powkernel
###   cndkernmatrix.ratikernel cndkernmatrix.rbfkernel
###   cndkernmatrix.studkernel cndkernmatrix.wavkernel
### Keywords: algebra array

### ** Examples

## use the iris data
data(iris)
dt <- as.matrix(iris[ ,-5])

## initialize cndkernel function
lapl <- laplcnd(gamma = 1)
lapl

## calculate cndkernel matrix
cndkernmatrix(lapl, dt)



