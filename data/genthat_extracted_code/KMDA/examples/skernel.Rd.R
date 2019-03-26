library(KMDA)


### Name: skernel
### Title: Stratified Kernel
### Aliases: skernel

### ** Examples

	x=c(0,0,1,2)
	y=c(0,1,2,0)
	z=c(0,0,3,4)
	## x and z are from the same stratum while x and y are not. 
	skernel(x,y,1)
	skernel(x,z,1)



