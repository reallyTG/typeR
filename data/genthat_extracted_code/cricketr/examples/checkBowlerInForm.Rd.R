library(cricketr)


### Name: checkBowlerInForm
### Title: Check whether the bowler is In-Form or Out-Of-Form by looking at
###   his last 10 percent scores
### Aliases: checkBowlerInForm
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <bowler>.csv obtained with getPlayerData()
# a <- getPlayerData(30176,file="kumble.csv",type="batting", homeOrAway=c(1,2),result=c(1,2,4))

# Retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "kumble.csv", package = "cricketr")
checkBowlerInForm(pathToFile,"Anil Kumble")

#Note: This example uses the file kumble.csv from the /data directory. However
#you can use any directory as long as the data file exists in that directory.
# The general format is pkg-function(pathToFile,par1,...)



