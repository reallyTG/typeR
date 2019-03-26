library(CADFtest)


### Name: update.CADFtest
### Title: Function to update the formula of CADFtest objects
### Aliases: update.CADFtest

### ** Examples

  data(npext, package="urca")
  npext$unemrate <- exp(npext$unemploy)      # compute unemployment rate
  L <- ts(npext, start=1860)                 # time series of levels
  D <- diff(L)                               # time series of diffs
  S <- window(ts.intersect(L,D), start=1909) # select same sample as Hansen's
  CADFt <- CADFtest(L.gnpperca~D.unemrate, data=S, max.lag.y=3,
    kernel="Parzen", prewhite=FALSE)
  CADFt.2 <- update(CADFt, change=list("+ D.indprod", "max.lag.X=3", 
	"criterion='BIC'"))



