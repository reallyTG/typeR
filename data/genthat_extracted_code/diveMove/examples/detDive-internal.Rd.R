library(diveMove)


### Name: detDive-internal
### Title: Detect dives from depth readings
### Aliases: detDive-internal .detDive
### Keywords: internal

### ** Examples


## No test: 
## Too long for checks
## Continuing the Example from '?calibrateDepth':
utils::example("calibrateDepth", package="diveMove",
               ask=FALSE, echo=FALSE)
dcalib		# the 'TDRcalibrate' that was created

tdr <- getTDR(dcalib)

## Extract the gross activity from an already calibrated TDR object
gross.act <- getGAct(dcalib)
detd <- diveMove:::.detDive(getDepth(tdr), gross.act[[2]], 3)

## End(No test)




