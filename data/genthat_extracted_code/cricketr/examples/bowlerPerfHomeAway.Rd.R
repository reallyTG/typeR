library(cricketr)


### Name: bowlerPerfHomeAway
### Title: This function analyses the performance of the bowler at home and
###   overseas
### Aliases: bowlerPerfHomeAway
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <bowler>.csv obtained with getPlayerDataSp()
#kumbleSp <-getPlayerDataSp(30176,".","kumblesp.csv","bowling")

# Retrieve the file path of a data file installed with cricketr
path <- system.file("data", "kumblesp.csv", package = "cricketr")
bowlerPerfHomeAway(path,"Anil Kumble")

# Note: This example uses the file kumble.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.




