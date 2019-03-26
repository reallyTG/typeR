library(KERE)


### Name: kernel-class
### Title: Class "kernel" "rbfkernel" "polykernel", "tanhkernel",
###   "vanillakernel"
### Aliases: rbfkernel-class polykernel-class vanillakernel-class
###   tanhkernel-class anovakernel-class besselkernel-class
###   laplacekernel-class splinekernel-class fourierkernel-class
###   kfunction-class kernel-class kpar,kernel-method
### Keywords: classes

### ** Examples


rbfkernel <- rbfdot(sigma = 0.1)
rbfkernel
is(rbfkernel)
kpar(rbfkernel)




