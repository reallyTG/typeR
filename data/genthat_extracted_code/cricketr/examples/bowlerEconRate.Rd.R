library(cricketr)


### Name: bowlerEconRate
### Title: Compute and plot the Mean Economy Rate versus wickets taken
### Aliases: bowlerEconRate
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <bowler>.csv obtained with getPlayerData()
# kumble <- getPlayerData(30176,dir=".", file="kumble.csv",type="batting", 
# homeOrAway=c(1,2),result=c(1,2,4))


# Retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "kumble.csv", package = "cricketr")
bowlerEconRate(pathToFile,"Anil Kumble")

# Note: This example uses the file kumble.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.
# The general format is pkg-function(pathToFile,par1,...)



