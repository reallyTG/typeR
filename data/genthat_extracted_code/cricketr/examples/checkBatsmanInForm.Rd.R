library(cricketr)


### Name: checkBatsmanInForm
### Title: Check whether the batsman is In-Form or Out-Of-Form by looking
###   at his last 10 percent scores
### Aliases: checkBatsmanInForm
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "tendulkar.csv", package = "cricketr")
checkBatsmanInForm(pathToFile,"Sachin Tendulkar")

#Note: This example uses the file tendulkar.csv from the /data directory. However
#you can use any directory as long as the data file exists in that directory.
# The general format is pkg-function(pathToFile,par1,...)



