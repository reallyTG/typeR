library(CADFtest)


### Name: CADFtest
### Title: Hansen's Covariate-Augmented Dickey Fuller (CADF) test for unit
###   roots
### Aliases: CADFtest CADFtest.formula CADFtest.default
### Keywords: ts htest univar

### ** Examples

##---- ADF test on extended Nelson-Plosser data ----
##--   Data taken from package urca
  data(npext, package="urca")
  ADFt <- CADFtest(npext$gnpperca, max.lag.y=3, type="trend")

##---- CADF test on extended Nelson-Plosser data ----
  data(npext, package="urca")
  npext$unemrate <- exp(npext$unemploy)      # compute unemployment rate
  L <- ts(npext, start=1860)                 # time series of levels
  D <- diff(L)                               # time series of diffs
  S <- window(ts.intersect(L,D), start=1909) # select same sample as Hansen's
  CADFt <- CADFtest(L.gnpperca~D.unemrate, data=S, max.lag.y=3,
    kernel="Parzen", prewhite=FALSE)



