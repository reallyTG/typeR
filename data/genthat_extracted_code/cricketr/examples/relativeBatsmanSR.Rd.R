library(cricketr)


### Name: relativeBatsmanSR
### Title: Calculate and plot the relative Mean Strike Rate (SR) for each
###   batsman
### Aliases: relativeBatsmanSR
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get the list of the <batsman>.csv files obtained with getPlayerData() for batsmen to be compared
# tendulkar  <- getPlayerData(35320,file="tendulkar.csv",
#type="batting", homeOrAway=c(1,2),result=c(1,2,4))

# Retrieve the file path of a data file installed with cricketr
tendulkar <- system.file("data", "tendulkar.csv", package = "cricketr")
ganguly <- system.file("data", "ganguly.csv", package = "cricketr")
dravid <- system.file("data", "dravid.csv", package = "cricketr")

batsmen <- list(tendulkar,dravid,ganguly)
names <- list("Tendulkar","Dravid","Ganguly")
relativeBatsmanSR(batsmen,names)

#Note: This example uses the /data directory for the files. However
#you can use any directory as long as the data files exists in that directory.



