library(kedd)


### Name: kernel.conv
### Title: Convolutions of r'th Derivative for Kernel Function
### Aliases: kernel.conv kernel.conv.default
### Keywords: nonparametric kernel

### ** Examples

kernels <- eval(formals(kernel.conv.default)$kernel)
kernels

## gaussian
kernel.conv(x = 0,kernel=kernels[1],deriv.order=0)
kernel.conv(x = 0,kernel=kernels[1],deriv.order=1)

## silverman
kernel.conv(x = 0,kernel=kernels[9],deriv.order=0)
kernel.conv(x = 0,kernel=kernels[9],deriv.order=1)



