library(texmex)


### Name: mexRangeFit
### Title: Estimate dependence parameters in a conditional multivariate
###   extreme values model over a range of thresholds.
### Aliases: mexRangeFit
### Keywords: models multivariate

### ** Examples


## No test: 
  w <- migpd(winter, mqu=.7)
  w
  par(mfrow=c(4,2))
  mexRangeFit(w,which=1,main="Winter data, Heffernan and Tawn 2004",cex=0.5)
## End(No test)
  



