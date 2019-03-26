library(cricketr)


### Name: bowlerWktRateTT
### Title: Compute and plot the Mean number of deliveries versus wickets
###   taken
### Aliases: bowlerWktRateTT
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <bowler>.csv obtained with getPlayerData()
# a <- getPlayerDataTT(26421,dir=".",file="ashwin.csv",type="bowling", 
# homeOrAway=c(1,2,3), result=c(1,2,3,5))

# Retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "ashwin.csv", package = "cricketr")
bowlerWktRateTT(pathToFile,"R Ashwin")

# Note: This example uses the file kumble.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.
# The general format is pkg-function(pathToFile,par1,...)



