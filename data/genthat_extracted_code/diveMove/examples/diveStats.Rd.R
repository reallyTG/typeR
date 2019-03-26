library(diveMove)


### Name: diveStats
### Title: Per-dive statistics
### Aliases: diveStats oneDiveStats stampDive
### Keywords: arith math

### ** Examples


## No test: 
## Too long for checks
## Continuing the Example from '?calibrateDepth':
utils::example("calibrateDepth", package="diveMove",
               ask=FALSE, echo=FALSE)
dcalib		# the 'TDRcalibrate' that was created

tdrX <- diveStats(dcalib)
stamps <- stampDive(dcalib, ignoreZ=TRUE)
tdrX.tab <- data.frame(stamps, tdrX)
summary(tdrX.tab)

## End(No test)




