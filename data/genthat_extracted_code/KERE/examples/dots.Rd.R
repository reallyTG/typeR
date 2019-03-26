library(KERE)


### Name: dots
### Title: Kernel Functions
### Aliases: dots kernels rbfdot polydot tanhdot vanilladot laplacedot
###   besseldot anovadot fourierdot splinedot kpar kfunction
###   show,kernel-method
### Keywords: symbolmath

### ** Examples

rbfkernel <- rbfdot(sigma = 0.1)
rbfkernel

kpar(rbfkernel)

## create two vectors
x <- rnorm(10)
y <- rnorm(10)

## calculate dot product
rbfkernel(x,y)




