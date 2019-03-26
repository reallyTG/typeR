library(spatstat)


### Name: CDF
### Title: Cumulative Distribution Function From Kernel Density Estimate
### Aliases: CDF CDF.density
### Keywords: nonparametric univar

### ** Examples

   b <- density(runif(10))
   f <- CDF(b)
   f(0.5)
   plot(f)



