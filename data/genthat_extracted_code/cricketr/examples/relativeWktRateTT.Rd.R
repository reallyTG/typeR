library(cricketr)


### Name: relativeWktRateTT
### Title: Compute and plot the relative Mean Wicket Rate of the bowlers in
###   Twenty20 International
### Aliases: relativeWktRateTT
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <bowler>.csv obtained with getPlayerData()
# a <- getPlayerDataTT(26421,dir=".",file="ashwin.csv",type="bowling", 
# homeOrAway=c(1,2,3), result=c(1,2,3,5))

# Retrieve the file path of a data file installed with cricketr
mendis <- system.file("data", "mendis.csv", package = "cricketr")
narine  <- system.file("data", "narine.csv", package = "cricketr")
badree <- system.file("data", "badree.csv", package = "cricketr")

frames <- list(mendis, badree,narine)
names <- c("Mendis","Badree","Narine")
relativeWktRateTT(frames,names)

#Note: This example uses the /data directory for the files. However
#you can use any directory as long as the data files exists in that directory.



