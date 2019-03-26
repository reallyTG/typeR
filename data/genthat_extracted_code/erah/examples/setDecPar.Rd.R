library(erah)


### Name: setDecPar
### Title: Set Software Parameters
### Aliases: setDecPar

### ** Examples


# The following will set eRah for analyzing the chromatograms
# from minutes 5 to 15, and withouth taking into account the masses
# 35:69,73:75,147:149, widht a minimum peak widht of 0.7 seconds.

ex.dec.par <- setDecPar(min.peak.width=0.7, min.peak.height=5000, 
noise.threshold=500, avoid.processing.mz=c(35:69,73:75,147:149), 
analysis.time=c(5,15))




