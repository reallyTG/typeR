library(KarsTS)


### Name: getClassEnvir
### Title: getClassEnvir: get objects of a class from an environment
### Aliases: getClassEnvir
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Generate a time series
genTSExample(name = "TS", InKTSEnv = TRUE)
## Generate some gap sets consisiting of four gaps of 3 NAs each
genGapExample(KTSEnv$TS, 3, 4, name = "NewGapSet1", InKTSEnv = TRUE)
genGapExample(KTSEnv$TS, 3, 4, name = "NewGapSet2", InKTSEnv = TRUE)
genGapExample(KTSEnv$TS, 3, 4, name = "NewGapSet3", InKTSEnv = TRUE)

KTSEnv$NoGapSet <- list(1:6, 3:4, "Lemon")

# Get the lists in KTSEnv (gap sets and other)
listsInKTSEnvget <- getClassEnvir(classGet = "list", envir = KTSEnv)
# Detect gap sets in the environment KTSEnv
detectedGapSets <- gapDetect()

listsInKTSEnvget
detectedGapSets




