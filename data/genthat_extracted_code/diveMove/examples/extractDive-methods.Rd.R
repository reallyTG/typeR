library(diveMove)


### Name: extractDive-methods
### Title: Extract Dives from "TDR" or "TDRcalibrate" Objects
### Aliases: extractDive-methods extractDive
###   extractDive,TDR,numeric,numeric-method
###   extractDive,TDRcalibrate,numeric,missing-method
### Keywords: methods

### ** Examples


## No test: 
## Too long for checks
## Continuing the Example from '?calibrateDepth':
utils::example("calibrateDepth", package="diveMove",
               ask=FALSE, echo=FALSE)
dcalib		# the 'TDRcalibrate' that was created

diveX <- extractDive(divesTDR, 9, getDAct(dcalib, "dive.id"))
plotTDR(diveX, interact=FALSE)

diveX <- extractDive(dcalib, 5:10)
plotTDR(diveX, interact=FALSE)

## End(No test)




