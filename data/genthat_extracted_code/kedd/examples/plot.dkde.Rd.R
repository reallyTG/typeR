library(kedd)


### Name: plot.dkde
### Title: Plot for Kernel Density Derivative Estimate
### Aliases: plot.dkde lines.dkde
### Keywords: plot

### ** Examples

plot(dkde(kurtotic,deriv.order=0,kernel="gaussian"),sub="")
lines(dkde(kurtotic,deriv.order=0,kernel="biweight"),col="red")



