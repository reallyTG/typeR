library(BivRegBLS)


### Name: MD.plot
### Title: Display the CBLS regression, or univariate tolerance intervals
###   in a (M,D) plot
### Aliases: MD.plot
### Keywords: CBLS regression MD plot Bland-Altman confidence interval
###   predictive interval confidence bands generalized interval

### ** Examples

library(BivRegBLS)
data(SBP)
# Estimate the CBLS regression on replicated data
res.CBLS=CBLS(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10)
# Plot the results in a (M,D) plot with an acceptance interval
MD.plot(results=res.CBLS,xname="J",yname="S",accept.int=10,accept.int.perc=FALSE)
MD.plot(results=res.CBLS,xname="J",yname="S",accept.int=10,accept.int.perc=TRUE)
MD.plot(results=res.CBLS,xname="J",yname="S",accept.int=c(10,15),
        accept.int.perc=FALSE,accept.int.threshold=150)



