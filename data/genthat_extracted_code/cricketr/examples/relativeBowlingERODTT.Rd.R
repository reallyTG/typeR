library(cricketr)


### Name: relativeBowlingERODTT
### Title: Compute and plot the relative mean Economy Rate(ER) of the
###   bowlers for ODI or Twenty20
### Aliases: relativeBowlingERODTT
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <bowler>.csv obtained with getPlayerData()
# a <- getPlayerData(47492,file="steyn.csv",type="bowling", 
# homeOrAway=c(1,2),result=c(1,2,4))

# Retrieve the file path of a data file installed with cricketr
steyn <- system.file("data", "steyn.csv", package = "cricketr")
mitchell <- system.file("data", "mitchell.csv", package = "cricketr")
southee <- system.file("data", "southee.csv", package = "cricketr")
malinga <- system.file("data", "malinga.csv", package = "cricketr")

frames <- list(steyn,mitchell,southee,malinga)
names <- c("Steyn","Mitchell","Southee","Malinga")
relativeBowlingERODTT(frames,names)

# Note: This example uses the /data directory for the files. However
# you can use any directory as long as the data files exists in that directory.



