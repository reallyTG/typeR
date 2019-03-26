library(spatstat)


### Name: bw.ppl
### Title: Likelihood Cross Validation Bandwidth Selection for Kernel
###   Density
### Aliases: bw.ppl
### Keywords: spatial methods smooth

### ** Examples

  ## No test: 
    b <- bw.ppl(redwood)
    plot(b, main="Likelihood cross validation for redwoods")
    plot(density(redwood, b))
  
## End(No test)
  ## Don't show: 
    b <- bw.ppl(redwood, srange=c(0.03, 0.07), ns=2)
  
## End(Don't show)



