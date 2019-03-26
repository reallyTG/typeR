library(cricketr)


### Name: batsman4s
### Title: Plot the numbers of 4s against the runs scored by batsman
### Aliases: batsman4s
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <batsman>.csv obtained with getPlayerData()
#tendulkar  <- getPlayerData(35320,dir="../",file="tendulkar.csv",type="batting",
#homeOrAway=c(1,2),result=c(1,2,4))

# retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "tendulkar.csv", package = "cricketr")
batsman4s(pathToFile, "Sachin Tendulkar")

# Note: The above example uses the file tendulkar.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory. The
# general format is pkg-function(pathToFile,par1,...)



