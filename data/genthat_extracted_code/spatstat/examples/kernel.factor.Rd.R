library(spatstat)


### Name: kernel.factor
### Title: Scale factor for density kernel
### Aliases: kernel.factor
### Keywords: methods nonparametric smooth

### ** Examples

   kernel.factor("rect")
   # bandwidth for Epanechnikov kernel with half-width h=1
   h <- 1
   bw <- h/kernel.factor("epa")



