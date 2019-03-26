library(rcarbon)


### Name: mixCurves
### Title: Creates mixed terrestrial/marine calibration curves.
### Aliases: mixCurves

### ** Examples

myCurve <- mixCurves('intcal13',p=0.7,resOffsets=300,resErrors=20)
x <- calibrate(4000,30,calCurves=myCurve)



