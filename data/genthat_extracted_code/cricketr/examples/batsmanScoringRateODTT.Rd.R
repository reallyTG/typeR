library(cricketr)


### Name: batsmanScoringRateODTT
### Title: Compute and plot the predicted scoring rate for a One day
###   batsman or Twenty20
### Aliases: batsmanScoringRateODTT
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <batsman>.csv obtained with getPlayerDataOD() or or getPlayerTT()
#sehwag <-getPlayerData(35263,dir="./mytest", file="sehwag.csv",type="batting",
# homeOrAway=c(1,2),result=c(1,2,4))

# Retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "sehwag.csv", package = "cricketr")
batsmanScoringRateODTT(pathToFile,"Sehwag")

# Note: This example uses the file sehwag.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.
# The general format is pkg-function(pathToFile,par1,...)



