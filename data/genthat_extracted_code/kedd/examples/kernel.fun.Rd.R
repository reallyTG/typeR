library(kedd)


### Name: kernel.fun
### Title: Derivatives of Kernel Function
### Aliases: kernel.fun kernel.fun.default
### Keywords: nonparametric kernel

### ** Examples

kernels <- eval(formals(kernel.fun.default)$kernel)
kernels

## gaussian
kernel.fun(x = 0,kernel=kernels[1],deriv.order=0)
kernel.fun(x = 0,kernel=kernels[1],deriv.order=1)

## silverman
kernel.fun(x = 0,kernel=kernels[9],deriv.order=0)
kernel.fun(x = 0,kernel=kernels[9],deriv.order=1)



