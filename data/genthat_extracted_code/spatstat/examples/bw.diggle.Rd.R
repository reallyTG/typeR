library(spatstat)


### Name: bw.diggle
### Title: Cross Validated Bandwidth Selection for Kernel Density
### Aliases: bw.diggle
### Keywords: spatial methods smooth

### ** Examples

  data(lansing)
  attach(split(lansing))
  b <- bw.diggle(hickory)
  plot(b, ylim=c(-2, 0), main="Cross validation for hickories")
  ## No test: 
   plot(density(hickory, b))
  
## End(No test)



