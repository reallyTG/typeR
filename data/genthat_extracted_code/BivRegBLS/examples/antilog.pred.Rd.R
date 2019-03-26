library(BivRegBLS)


### Name: antilog.pred
### Title: Back transforms the results if a logarithmic transformation is
###   used
### Aliases: antilog.pred
### Keywords: log normal exponential

### ** Examples

library(BivRegBLS)
data(SBP)
SBPlog=SBP
SBPlog[,2:10]=log(SBPlog[,2:10])
res.BLS.log=BLS(data=SBPlog,xcol=c("J1","J2","J3"),ycol=8:10)
res.BLS=antilog.pred(results=res.BLS.log,base="e")



