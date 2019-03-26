library(EGRET)


### Name: setSeasonLabel
### Title: Create a character variable that describes the period of
###   analysis, when period of analysis has already been set in
###   AnnualResults
### Aliases: setSeasonLabel
### Keywords: graphics quality water

### ** Examples

eList <- Choptank_eList
Daily <- getDaily(eList)
AnnualResults <- setupYears(Daily)
setSeasonLabel(AnnualResults)



