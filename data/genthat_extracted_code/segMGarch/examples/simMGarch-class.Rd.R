library(segMGarch)


### Name: simMGarch-class
### Title: An S4 class for a nonstationary CCC model.
### Aliases: simMGarch-class

### ** Examples

pw.CCC.obj <- new("simMGarch")
pw.CCC.obj <- pc_cccsim(pw.CCC.obj)
par(mfrow=c(2,2))
ts.plot(pw.CCC.obj@y[1,]);ts.plot(pw.CCC.obj@y[2,])
ts.plot(pw.CCC.obj@h[1,]);ts.plot(pw.CCC.obj@h[1,])



