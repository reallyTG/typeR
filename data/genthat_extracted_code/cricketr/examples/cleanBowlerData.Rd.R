library(cricketr)


### Name: cleanBowlerData
### Title: Clean the bowlers data frame
### Aliases: cleanBowlerData
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Get bowling data and store in file for future
# kumble <- getPlayerData(30176,dir="./mytest", file="kumble.csv",type="bowling", 
# homeOrAway=c(1),result=c(1,2))

pathToFile <- system.file("data", "kumble.csv", package = "cricketr")
cleanBowlerData(pathToFile)

# Note: This example uses the file kumble.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.



