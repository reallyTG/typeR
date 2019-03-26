library(cricketr)


### Name: batsmanAvgRunsOpposition
### Title: This function computes and plots the Average runs against
###   different opposition played by batsman
### Aliases: batsmanAvgRunsOpposition
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <batsman>.csv obtained with getPlayerData()
#  <- getPlayerData(35320,file="tendulkar.csv",type="batting", homeOrAway=c(1,2),result=c(1,2,4))

# retrieve the file path of a data file installed with cricketr
path <- system.file("data", "tendulkar.csv", package = "cricketr")
batsmanAvgRunsOpposition(path,"Sachin Tendulkar")

# Note: The above example uses the file tendulkar.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.



