library(dtwSat)


### Name: get
### Title: Get elements from twdtwMatches objects
### Aliases: get getAlignments,twdtwMatches-method getAlignments
###   getInternals,twdtwMatches-method getInternals
###   getMatches,twdtwMatches-method getMatches

### ** Examples

# Getting patterns from objects of class twdtwMatches
patt = twdtwTimeSeries(MOD13Q1.patterns.list)
ts = twdtwTimeSeries(MOD13Q1.ts.list)
mat = twdtwApply(x=ts, y=patt, weight.fun=logisticWeight(-0.1,100), keep=TRUE)
getPatterns(mat)
getTimeSeries(mat)
getAlignments(mat)
getMatches(mat)
getInternals(mat)




