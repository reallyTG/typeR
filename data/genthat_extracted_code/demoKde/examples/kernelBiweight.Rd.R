library(demoKde)


### Name: kernelBiweight
### Title: Kernel functions for use with kde
### Aliases: kernelBiweight kernelCosine kernelEpanechnikov kernelGaussian
###   kernelLogistic kernelOptCosine kernelRectangular kernelSquaredCosine
###   kernelTriangular kernelTricube kernelTriweight kernelUniform
### Keywords: distribution dplot

### ** Examples

if(require("graphics")) {
  curve(kernelGaussian, xlim = c(-4.5, 4.5), ylim = c(0, 0.45))
  curve(kernelLogistic, add = TRUE, col = "red")
  curve(kernelUniform, add = TRUE, col = "blue", lwd=2, n = 5000)
}



