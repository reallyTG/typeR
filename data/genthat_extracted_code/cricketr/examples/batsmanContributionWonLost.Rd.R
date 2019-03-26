library(cricketr)


### Name: batsmanContributionWonLost
### Title: Disply the batsman's contribution in matches that were won and
###   those that were lost
### Aliases: batsmanContributionWonLost
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <batsman>.csv obtained with getPlayerData()
#tendulkarsp <-getPlayerDataSp(35320,".","tendulkarsp.csv","batting")
# retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "tendulkarsp.csv", package = "cricketr")
batsmanContributionWonLost(pathToFile,"Sachin Tendulkar")

# Note: The above example uses the file tendulkar.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.
# The general format is pkg-function(pathToFile,par1,...)



