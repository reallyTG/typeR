library(quantspec)


### Name: plot-LagKernelWeight
### Title: Plot the values of the 'LagKernelWeight'.
### Aliases: plot,LagKernelWeight,missing-method plot-LagKernelWeight

### ** Examples

plot(lagKernelWeight(WParzen, bw=10, K = 20),
       ylab=expression(W[n](x)),
       xlab=expression(x),
       main="Weights to the Parzen Window")



