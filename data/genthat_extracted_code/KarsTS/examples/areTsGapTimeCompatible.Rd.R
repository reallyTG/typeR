library(KarsTS)


### Name: areTsGapTimeCompatible
### Title: areTsGapTimeCompatible: tests time compatibility between a time
###   series and a gap set
### Aliases: areTsGapTimeCompatible
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Generate a time series
TS <- genTSExample(InKTSEnv = FALSE)
## Generate a gap set consisiting of four gaps of 3 NAs each
GS <- genGapExample(TS, 3, 4, InKTSEnv = FALSE)

## They are obviously compatible since we use TS to create GS
timeComp <- areTsGapTimeCompatible (TS, GS)
timeComp

## We modifify the time of TS. The initial dates are not compatible anymore,
## although the sampling period and the length remain untouched.
TS$time <- TS$time + 1
timeComp <-  areTsGapTimeCompatible (TS, GS)
timeComp




