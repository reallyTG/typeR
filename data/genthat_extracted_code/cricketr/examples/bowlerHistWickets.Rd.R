library(cricketr)


### Name: bowlerHistWickets
### Title: Plot a histogram of Wicket percentages versus wickets taken
### Aliases: bowlerHistWickets
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <batsman>.csv obtained with getPlayerData()
#  <- getPlayerData(30176,file="kumble.csv",type="bowling", homeOrAway=c(1,2),result=c(1,2,4))

# Retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "kumble.csv", package = "cricketr")
bowlerHistWickets(pathToFile, "Anil Kumble")

# Note: This example uses the file kumble.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.
# The general format is pkg-function(pathToFile,par1,...)




