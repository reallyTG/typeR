library(spatstat)


### Name: kernel.squint
### Title: Integral of Squared Kernel
### Aliases: kernel.squint
### Keywords: methods nonparametric smooth

### ** Examples

   kernel.squint("gaussian", 3)

   # integral of squared Epanechnikov kernel with half-width h=1
   h <- 1
   bw <- h/kernel.factor("epa")
   kernel.squint("epa", bw)



