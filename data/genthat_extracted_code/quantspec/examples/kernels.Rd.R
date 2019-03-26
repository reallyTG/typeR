library(quantspec)


### Name: kernels
### Title: Kernel function.
### Aliases: W0 W1 W2 W3 WDaniell WParzen kernels

### ** Examples

plot(x=seq(-8,8,0.05), y=W0(seq(-8,8,0.05)), type="l")
plot(x=seq(-8,8,0.05), y=W1(seq(-8,8,0.05)), type="l")
plot(x=seq(-8,8,0.05), y=W2(seq(-8,8,0.05)), type="l")
plot(x=seq(-8,8,0.05), y=W3(seq(-8,8,0.05)), type="l")
plot(x=seq(-pi,pi,0.05), y=WDaniell(seq(-pi,pi,0.05),a=(pi/2)), type="l")
plot(x=seq(-2,2,0.05),y=WParzen(seq(-2,2,0.05)),type = "l")



