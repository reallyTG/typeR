library(spatstat.local)


### Name: bw.loccit
### Title: Cross Validated Bandwidth Selection for Locally Fitted Point
###   Process Model
### Aliases: bw.loccit
### Keywords: spatial models smooth

### ** Examples

  X <- redwood[owin(c(0,1), c(-1,-1/2))]
  Ns <- if(interactive()) 16 else 2
  b <- bw.loccit(X, ~1, "Thomas", srange=c(0.07, 0.14), ns=Ns)
  b
  plot(b)



