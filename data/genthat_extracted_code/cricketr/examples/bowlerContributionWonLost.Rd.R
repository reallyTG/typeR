library(cricketr)


### Name: bowlerContributionWonLost
### Title: Display the bowler's contribution in matches that were won and
###   those that were lost
### Aliases: bowlerContributionWonLost
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <bowler>.csv obtained with getPlayerDataSp()
#kumbleSp <-getPlayerDataSp(30176,".","kumblesp.csv","bowling")
# Retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "kumblesp.csv", package = "cricketr")
bowlerContributionWonLost(pathToFile,"Anil Kumble")

# Note: This example uses the file kumble.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.
# The general format is pkg-function(pathToFile,par1,...)



