library(BivRegBLS)


### Name: BivRegBLS-package
### Title: Tolerance Intervals and Errors-in-Variables Regressions in
###   Method Comparison Studies
### Aliases: BivRegBLS-package BivRegBLS
### Keywords: BivRegBLS

### ** Examples

library(BivRegBLS)
data(SBP)
### Descriptive statistics
res=desc.stat(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10)
raw.plot(data.plot=res,xname="J",yname="S",graph="XY.bar.SEM")
### BLS regression in an (X,Y) plot
res.BLS=BLS(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10,qx=3,qy=3)
XY.plot(BLS.results=res.BLS,xname="J",yname="S",accept.int=10,accept.int.perc=FALSE)
### CBLS regression in an (M,D) plot
res.CBLS=CBLS(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10)
MD.plot(results=res.CBLS,xname="J",yname="S",
        accept.int=10,accept.int.perc=FALSE,include.int=TRUE,graph.int=c("CI","GI"))
### Univariate tolerance intervals in an (M,D) plot
res.MD.horiz=MD.horiz.lines(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10,pred.level=0.95)
MD.plot(results=res.MD.horiz,xname="J",yname="S",
        accept.int=10,accept.int.perc=FALSE,include.int=TRUE,graph.horiz.int=c("bTI","bgTI"))



