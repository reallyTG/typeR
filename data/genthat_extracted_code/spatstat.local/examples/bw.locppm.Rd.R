library(spatstat.local)


### Name: bw.locppm
### Title: Cross Validated Bandwidth Selection for Locally Fitted Point
###   Process Model
### Aliases: bw.locppm
### Keywords: spatial models smooth

### ** Examples

  Ns <- if(interactive()) 16 else 2
  b <- bw.locppm(swedishpines, ~1, srange=c(2.5,4.5), ns=Ns)
  b
  plot(b)



