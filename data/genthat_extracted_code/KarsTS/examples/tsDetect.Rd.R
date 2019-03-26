library(KarsTS)


### Name: tsDetect
### Title: tsDetect: identifies the time series currently loaded
### Aliases: tsDetect
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Generate a time series
genTSExample(name = "TS", InKTSEnv = TRUE)
## Generate some gap sets consisiting of four gaps of 3 NAs each
genGapExample(KTSEnv$TS, 3, 4, name = "NewGapSet1", InKTSEnv = TRUE)
genGapExample(KTSEnv$TS, 3, 4, name = "NewGapSet2", InKTSEnv = TRUE)
genGapExample(KTSEnv$TS, 3, 4, name = "NewGapSet3", InKTSEnv = TRUE)

# Detect time series in the environment KTSEnv
detectedTS <- tsDetect()
detectedTS

# Detect gap sets in the environment KTSEnv
detectedGapSets <- gapDetect()
detectedGapSets




