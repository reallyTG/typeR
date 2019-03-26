library(segMGarch)


### Name: pc_cccsim-class
### Title: A method to simulate nonstationary high-dimensional CCC GARCH
###   models.
### Aliases: pc_cccsim-class pc_cccsim pc_cccsim-methods
###   pc_cccsim,simMGarch-method

### ** Examples

pw.CCC.obj <- new("simMGarch")
pw.CCC.obj <- pc_cccsim(pw.CCC.obj)
par(mfrow=c(1,2))
ts.plot(pw.CCC.obj@y[1,],main="a single simulated time series",ylab="series")
ts.plot(pw.CCC.obj@h[1,],main="a single simulated conditional variance",ylab="variance")



