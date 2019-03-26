library(cricketr)


### Name: batsman4s6s
### Title: Compute and plot a stacked barplot of runs,4s and 6s
### Aliases: batsman4s6s
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <batsman>.csv obtained with getPlayerDataOD()
#sehwag <-getPlayerData(35263,dir="./data", file="sehwag.csv",type="batting", 
#homeOrAway=c(1,2),result=c(1,2,4))

# retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "tendulkar.csv", package = "cricketr")
batsman4s6s(pathToFile, "Sachin Tendulkar")

#Note: This example uses the file tendulkar.csv from the /data directory. However
#you can use any directory as long as the data file exists in that directory.
#The general format is pkg-function(pathToFile,par1,...)



