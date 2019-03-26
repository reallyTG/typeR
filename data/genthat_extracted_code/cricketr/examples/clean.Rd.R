library(cricketr)


### Name: clean
### Title: Create a batsman data frame given the batsman's CSV file
### Aliases: clean
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <batsman>.csv obtained with getPlayerData()
#  <- getPlayerData(35320,file="tendulkar.csv",type="batting", homeOrAway=c(1,2),result=c(1,2,4))

# clean the dataframe
pathToFile <- system.file("data", "tendulkar.csv", package = "cricketr")
clean(pathToFile)

# Note: This example uses the file kumble.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.



