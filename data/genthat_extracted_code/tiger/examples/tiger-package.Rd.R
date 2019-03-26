library(tiger)


### Name: tiger-package
### Title: TIme series of Grouped ERrors
### Aliases: tiger-package
### Keywords: package

### ** Examples

data(tiger.example)
modelled <- tiger.single$modelled
measured <- tiger.single$measured
peaks <- synth.peak.error(rise.factor=2, recession.const=0.02, rise.factor2=1.5)
## Not run: 
##D result2 <- tiger(modelled=modelled, measured=measured, window.size=240, synthetic.errors=peaks)
##D errors.in.time(d.dates, result2, solution=6, show.months=TRUE)
## End(Not run)




