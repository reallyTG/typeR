library(tiger)


### Name: tiger
### Title: Calculate temporal dynamics of model performance
### Aliases: tiger tiger.peaks
### Keywords: utilities

### ** Examples

data(tiger.example)
modelled <- tiger.single$modelled
measured <- tiger.single$measured
peaks <- synth.peak.error(rise.factor=2, recession.const=0.02, rise.factor2=1.5)
## Not run: 
##D result2 <- tiger(modelled=modelled, measured=measured, window.size=240, synthetic.errors=peaks)
##D errors.in.time(d.dates, result2, solution=6, show.months=TRUE)
## End(Not run)

peaks2 <- synth.peak.error(rise.factor=2, recession.const=0.02,
     rise.factor2=1.5, err1.factor=c(1.3,1.5,2.0),
     err2.factor = c(0.02,0.03,0.06), 
     err3.factor=c(2,4,10), 
     err4.factor = c(9,22,40), 
     err5.factor = c(0.2,0.3,0.5),
     err6.factor =c(2,3,5),
     err9.factor=c(1.5,3,6)
   )

## Not run: 
##D result3 <- tiger.peaks(result2, peaks2)
##D 
##D    peaks.in.clusters(result2, solution=6)
##D    x11()
##D    peaks.in.clusters(result3, solution=6)
## End(Not run)




