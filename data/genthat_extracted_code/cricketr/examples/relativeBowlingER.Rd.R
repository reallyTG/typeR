library(cricketr)


### Name: relativeBowlingER
### Title: Compute and plot the relative mean Economy Rate(ER) of the
###   bowlers
### Aliases: relativeBowlingER
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get the list of the <batsman>.csv files obtained with getPlayerData() for batsmen to be compared
# kumble  <- getPlayerData(30176,file="kumble.csv",type="bowling", 
# homeOrAway=c(1,2),result=c(1,2,4))

# Retrieve the file path of a data file installed with cricketr
kumble <- system.file("data", "kumble.csv", package = "cricketr")
warne <- system.file("data", "warne.csv", package = "cricketr")
murali <- system.file("data", "murali.csv", package = "cricketr")

frames <- list(kumble,warne,murali)
names <- c("Kumble","Warne","Murali")
relativeBowlingER(frames,names)

# Note: This example uses the /data directory for the files. However
# you can use any directory as long as the data files exists in that directory.



