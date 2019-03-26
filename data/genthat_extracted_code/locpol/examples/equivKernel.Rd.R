library(locpol)


### Name: equivKernel
### Title: Equivalent Kernel.
### Aliases: equivKernel
### Keywords: nonparametric smooth

### ** Examples

##	Some kernels and equiv. for higher order
##	compare with p=1 
curve(EpaK(x),-3,3,ylim=c(-.5,1))
f <- equivKernel(EpaK,0,3)
curve(f(x),-3,3,add=TRUE,col="blue")
curve(gaussK(x),-3,3,add=TRUE)
f <- equivKernel(gaussK,0,3)
curve(f(x),-3,3,add=TRUE,col="blue")
##	Draw several Equivalent locl polynomial kernels
curve(EpaK(x),-3,3,ylim=c(-.5,1))
for(p in 1:5){
	curve(equivKernel(gaussK,0,p)(x),-3,3,add=TRUE)
    }



