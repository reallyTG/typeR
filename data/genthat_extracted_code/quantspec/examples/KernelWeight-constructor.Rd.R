library(quantspec)


### Name: KernelWeight-constructor
### Title: Create an instance of the 'KernelWeight' class.
### Aliases: KernelWeight-constructor kernelWeight
### Keywords: Constructors

### ** Examples

wgt1 <- kernelWeight(W=W0, N=16, bw=c(0.1,0.3,0.7))
print(wgt1)
wgt2 <- kernelWeight(W=W1, N=2^8, bw=0.1)
plot(wgt2, main="Weights determined from Epanechnikov kernel")



