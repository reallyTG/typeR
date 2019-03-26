library(BivRegBLS)


### Name: XY.plot
### Title: Display the BLS regression in a (X,Y) plot
### Aliases: XY.plot
### Keywords: BLS regression XY plot confidence interval predictive
###   interval confidence bands generalized interval

### ** Examples

library(BivRegBLS)
data(SBP)
# Estimate the BLS regression on replicated data
res.BLS=BLS(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10,qx=3,qy=3)
# Plot the results in a (X,Y) plot with an acceptance interval
XY.plot(BLS.results=res.BLS,xname="J",yname="S",accept.int=10,accept.int.perc=FALSE)
XY.plot(BLS.results=res.BLS,xname="J",yname="S",accept.int=10,accept.int.perc=TRUE)
XY.plot(BLS.results=res.BLS,xname="J",yname="S",accept.int=c(10,20),
        accept.int.perc=FALSE,accept.int.threshold=150)



