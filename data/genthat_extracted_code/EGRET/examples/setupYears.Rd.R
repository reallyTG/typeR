library(EGRET)


### Name: setupYears
### Title: Creates the AnnualResults data frame from the Daily data frame
### Aliases: setupYears
### Keywords: statistics water-quality

### ** Examples

eList <- Choptank_eList
Daily <- getDaily(eList)
AnnualResults <- setupYears(Daily, 4, 10)





