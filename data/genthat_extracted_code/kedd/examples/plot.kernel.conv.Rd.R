library(kedd)


### Name: plot.kernel.conv
### Title: Plot for Convolutions of r'th Derivative Kernel Function
### Aliases: plot.kernel.conv
### Keywords: plot

### ** Examples

## Gaussian kernel

dev.new()
par(mfrow=c(2,2))
plot(kernel.conv(kernel="gaussian",deriv.order=0))
plot(kernel.conv(kernel="gaussian",deriv.order=1))
plot(kernel.conv(kernel="gaussian",deriv.order=2))
plot(kernel.conv(kernel="gaussian",deriv.order=3))

## Silverman kernel

dev.new()
par(mfrow=c(2,2))
plot(kernel.conv(kernel="silverman",deriv.order=0))
plot(kernel.conv(kernel="silverman",deriv.order=1))
plot(kernel.conv(kernel="silverman",deriv.order=2))
plot(kernel.conv(kernel="silverman",deriv.order=3))



