library(KarsTS)


### Name: are2TsTimeCompatible
### Title: are2TsTimeCompatible: test time compatibility between two time
###   series
### Aliases: are2TsTimeCompatible
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Generate two time series
TS1 <- genTSExample(InKTSEnv = FALSE)
TS2 <- genTSExample(InKTSEnv = FALSE)

## Their times are identical
timeComp <- are2TsTimeCompatible (TS1, TS2)
timeComp

## We modifify the time of TS2. Now their starts are different,
## although they still have same sampling period and length
TS2$time <- TS2$time + 1
timeComp <- are2TsTimeCompatible (TS1,  TS2)
timeComp




