library(diveMove)


### Name: calibrateSpeed
### Title: Calibrate and build a "TDRcalibrate" object
### Aliases: calibrateSpeed
### Keywords: manip math

### ** Examples


## No test: 
## Too long for checks
## Continuing the Example from '?calibrateDepth':
utils::example("calibrateDepth", package="diveMove",
               ask=FALSE, echo=FALSE)
dcalib		# the 'TDRcalibrate' that was created

## Calibrate speed using only changes in depth > 2 m
vcalib <- calibrateSpeed(dcalib, z=2)
vcalib

## End(No test)




