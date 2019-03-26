library(EGRET)


### Name: selectDays
### Title: Creates a subset Daily data frame that only contains daily
###   estimates for the specified period of analysis
### Aliases: selectDays
### Keywords: statistics streamflow

### ** Examples

eList <- Choptank_eList
Daily <- getDaily(eList)
DailySubset <- selectDays(Daily, 4, 11)



