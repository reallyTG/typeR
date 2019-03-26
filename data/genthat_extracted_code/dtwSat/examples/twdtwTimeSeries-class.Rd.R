library(dtwSat)


### Name: twdtwTimeSeries-class
### Title: class "twdtwTimeSeries"
### Aliases: twdtwTimeSeries-class twdtwTimeSeries
###   twdtwTimeSeries,ANY-method twdtwTimeSeries-create
###   dim,twdtwTimeSeries-method index,twdtwTimeSeries-method
###   nrow,twdtwTimeSeries-method ncol,twdtwTimeSeries-method
###   length,twdtwTimeSeries-method as.list,twdtwTimeSeries-method
###   [,twdtwTimeSeries,ANY,ANY,ANY-method
###   [[,twdtwTimeSeries,ANY,ANY-method labels,twdtwTimeSeries-method
###   levels,twdtwTimeSeries-method show,twdtwTimeSeries-method
###   is.twdtwTimeSeries,ANY-method is.twdtwTimeSeries

### ** Examples

# Creating a new object of class twdtwTimeSeries  
ptt = new("twdtwTimeSeries", timeseries = MOD13Q1.patterns.list, 
           labels = names(MOD13Q1.patterns.list))
class(ptt)
labels(ptt)
levels(ptt)
length(ptt)
nrow(ptt)
ncol(ptt)
dim(ptt)
# Creating objects of class twdtwTimeSeries from zoo objects
ts = twdtwTimeSeries(MOD13Q1.ts)
ts 

# Creating objects of class twdtwTimeSeries from list of zoo objects 
patt = twdtwTimeSeries(MOD13Q1.patterns.list)
patt

# Joining objects of class twdtwTimeSeries 
tsA = twdtwTimeSeries(MOD13Q1.ts.list[[1]], labels = "A")
tsB = twdtwTimeSeries(B = MOD13Q1.ts.list[[2]])
ts = twdtwTimeSeries(tsA, tsB, C=MOD13Q1.ts)
ts
 



