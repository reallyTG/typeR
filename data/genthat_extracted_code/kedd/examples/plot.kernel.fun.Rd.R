library(kedd)


### Name: plot.kernel.fun
### Title: Plot of r'th Derivative Kernel Function
### Aliases: plot.kernel.fun
### Keywords: plot

### ** Examples

## Gaussian kernel

dev.new()
par(mfrow=c(2,2))
plot(kernel.fun(kernel="gaussian",deriv.order=0))
plot(kernel.fun(kernel="gaussian",deriv.order=1))
plot(kernel.fun(kernel="gaussian",deriv.order=2))
plot(kernel.fun(kernel="gaussian",deriv.order=3))

## Silverman kernel

dev.new()
par(mfrow=c(2,2))
plot(kernel.fun(kernel="silverman",deriv.order=0))
plot(kernel.fun(kernel="silverman",deriv.order=1))
plot(kernel.fun(kernel="silverman",deriv.order=2))
plot(kernel.fun(kernel="silverman",deriv.order=3))



