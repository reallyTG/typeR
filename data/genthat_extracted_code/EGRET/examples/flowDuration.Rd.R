library(EGRET)


### Name: flowDuration
### Title: Computes several values of the flow duration curve for
###   streamflow centered on a specific date of the year
### Aliases: flowDuration
### Keywords: statistics streamflow,

### ** Examples

eList <- Choptank_eList
# for a window of 30 days either side of June 25 expressed in units of cfs:
flowDuration(eList,"06-25", qUnit=1,span=30) 
# for a flow-duration curve covering the whole year, expressed in units of csf: 
flowDuration(eList, "01-01", qUnit=2) 



