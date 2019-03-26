library(EGRET)


### Name: plotSDLogQ
### Title: Graph of the standard deviation of the log of daily discharge
###   versus year
### Aliases: plotSDLogQ
### Keywords: graphics statistics streamflow

### ** Examples

eList <- Choptank_eList
## Not run: 
##D # Water year:
##D plotSDLogQ(eList) 
##D plotSDLogQ(eList, 1998,2000) 
##D # Graphs consisting of Jun-Aug
##D eList <- setPA(eList, paStart=6,paLong=3)
##D plotSDLogQ(eList) 
## End(Not run)



