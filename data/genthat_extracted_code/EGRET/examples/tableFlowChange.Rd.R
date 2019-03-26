library(EGRET)


### Name: tableFlowChange
### Title: Prints table of change metrics for a given streamflow statistic
### Aliases: tableFlowChange
### Keywords: statistics streamflow

### ** Examples

eList <- Choptank_eList
tableFlowChange(eList, istat=5,yearPoints=c(2001,2005,2009))
df <- tableFlowChange(eList, istat=5,yearPoints=c(2001,2005,2009))



