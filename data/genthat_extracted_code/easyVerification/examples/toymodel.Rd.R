library(easyVerification)


### Name: toymodel
### Title: Create Example Forecast-Observation Pairs
### Aliases: toymodel toyarray toyarray
### Keywords: utilities

### ** Examples

## compute the correlation for a toy forecast with default parameters
tm <- toyarray()
f.corr <- veriApply("EnsCorr", fcst=tm$fcst, obs=tm$obs)
 



