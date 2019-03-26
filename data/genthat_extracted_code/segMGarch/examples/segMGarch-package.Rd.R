library(segMGarch)


### Name: segMGarch-package
### Title: Multiple Change-Point Detection for High-Dimensional GARCH
###   Processes
### Aliases: segMGarch-package segMGarch
### Keywords: multiple change-point detection, multivariate GARCH, stress
###   period selection, Double CUSUM Binary Segmentation, high
###   dimensionality, nonstationarity

### ** Examples

  ## Not run: 
##D #pw.CCC.obj <- new("simMGarch")
##D #pw.CCC.obj <- pc_cccsim(pw.CCC.obj)
##D #pw.CCC.obj@d=10
##D #pw.CCC.obj@n=1000
##D #pw.CCC.obj@changepoints=c(250,750)
##D #pw.CCC.obj <- pc_cccsim(pw.CCC.obj)
##D #dcs.obj=garch.seg(pw.CCC.obj@y)
##D #dcs.obj$est.cps
##D #ts.plot(t(pw.CCC.obj@y),col="grey");grid()
##D #abline(v=dcs.obj$est.cps,col="red" )
##D #abline(v=pw.CCC.obj@changepoints,col="blue" )
##D #legend("bottom", legend=c("Estimated change-points", "Real change-points"), 
##D #col=c("red", "blue"), lty=1:2, cex=0.8)
##D   
## End(Not run)



