library(extRemes)


### Name: threshrange.plot
### Title: Threshold Selection Through Fitting Models to a Range of
###   Thresholds
### Aliases: threshrange.plot
### Keywords: hplot htest models

### ** Examples

data(Fort)
threshrange.plot(Fort$Prec, r = c(1, 2.25), nint=5)

## Not run: 
##D threshrange.plot(Fort$Prec, r=c(0.01,1), nint=30, verbose=TRUE)
##D 
##D threshrange.plot(Fort$Prec, r=c(0.2,0.8), type="PP", nint=15,
##D     verbose=TRUE)
##D 
##D threshrange.plot(Fort$Prec, r=c(0.2,0.8), type="PP", nint=15,
##D     optim.args=list(method="Nelder-Mead"), verbose=TRUE)
##D 
## End(Not run)



