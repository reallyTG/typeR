library(cricketr)


### Name: batsmanRunsPredict
### Title: Predict the runs for the batsman given the Balls Faced and
###   Minutes in crease
### Aliases: batsmanRunsPredict
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <batsman>.csv obtained with getPlayerData()
# tendulkar <- getPlayerData(35320,file="tendulkar.csv",type="batting", 
# homeOrAway=c(1,2), result=c(1,2,4))

# Use a single value for BF and Mins
BF <- 30
Mins <- 20

# retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "tendulkar.csv", package = "cricketr")
batsmanRunsPredict(pathToFile,"Sachin Tendulkar",newdataframe=data.frame(BF,Mins))

#or give a data frame
#BF <- seq(20,200, length=15)
#Mins <- seq(30,220,length=15)

#values <- batsmanRunsPredict("../cricketr/data/tendulkar.csv","Sachin Tendulkar",
    #newdataframe=data.frame(BF,Runs)
#print(values)

# Note: The above example uses the file tendulkar.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.
# The general format is pkg-function(pathToFile,par1,...)



