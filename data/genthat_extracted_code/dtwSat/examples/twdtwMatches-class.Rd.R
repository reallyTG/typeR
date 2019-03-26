library(dtwSat)


### Name: twdtwMatches-class
### Title: class "twdtwMatches"
### Aliases: twdtwMatches-class twdtwMatches twdtwMatches,ANY-method
###   twdtwMatches-create index,twdtwMatches-method
###   length,twdtwMatches-method as.list,twdtwMatches-method
###   as.list,twdtwRaster-method [,twdtwMatches,ANY,ANY,ANY-method
###   [[,twdtwMatches,numeric,ANY-method labels,twdtwMatches-method
###   show,twdtwMatches-method is.twdtwMatches,ANY-method is.twdtwMatches

### ** Examples

ts = twdtwTimeSeries(timeseries=MOD13Q1.ts.list)
patterns = twdtwTimeSeries(timeseries=MOD13Q1.patterns.list)
matches = twdtwApply(x = ts, y = patterns)
class(matches)
length(matches)
matches 
# Creating objects of class twdtwMatches 
ts  = twdtwTimeSeries(MOD13Q1.ts.list)
patt = twdtwTimeSeries(MOD13Q1.patterns.list)
mat = twdtwApply(ts, patt, weight.fun = logisticWeight(-0.1, 100))
mat = twdtwMatches(ts, patterns=patt, alignments=mat)
mat




