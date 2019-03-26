library(dtwSat)


### Name: resampleTimeSeries
### Title: Resample time series
### Aliases: resampleTimeSeries resampleTimeSeries,twdtwTimeSeries-method
###   resampleTimeSeries-twdtwMatches

### ** Examples

# Resampling time series from objects of class twdtwTimeSeries
patt = twdtwTimeSeries(MOD13Q1.patterns.list)
npatt = resampleTimeSeries(patt, length=46)
nrow(patt)
nrow(npatt)




