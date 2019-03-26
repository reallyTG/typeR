library(FitAR)


### Name: PacfPlot
### Title: Plot Partial Autocorrelations and Limits
### Aliases: PacfPlot
### Keywords: ts

### ** Examples

#For the log(lynx) series and taking lag.max=15, the PacfPlot and
# the minimum BIC subset selection produce the same result.
z<-log(lynx)
PacfPlot(z)
SelectModel(z,lag.max=15,ARModel="ARz",Best=1,Criterion="BIC")	



