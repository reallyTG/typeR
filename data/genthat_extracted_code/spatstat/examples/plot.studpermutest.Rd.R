library(spatstat)


### Name: plot.studpermutest
### Title: Plot a Studentised Permutation Test
### Aliases: plot.studpermutest
### Keywords: hplot htest

### ** Examples

  np <- if(interactive()) 99 else 19
  testpyramidal <- studpermu.test(pyramidal, Neurons ~ group, nperm=np)
  plot(testpyramidal)
  plot(testpyramidal, meanonly=TRUE)
  op <- par(mfrow=c(1,3))
  plot(testpyramidal, separately=TRUE)
  plot(testpyramidal, separately=TRUE, col=2, lty=1, lwd.mean=2, col.mean=4)
  par(op)



