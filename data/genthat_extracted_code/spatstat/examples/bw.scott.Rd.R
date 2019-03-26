library(spatstat)


### Name: bw.scott
### Title: Scott's Rule for Bandwidth Selection for Kernel Density
### Aliases: bw.scott
### Keywords: spatial methods smooth

### ** Examples

  data(lansing)
  attach(split(lansing))
  b <- bw.scott(hickory)
  b
  ## No test: 
   plot(density(hickory, b))
  
## End(No test)



