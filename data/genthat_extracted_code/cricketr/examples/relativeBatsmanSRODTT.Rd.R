library(cricketr)


### Name: relativeBatsmanSRODTT
### Title: Calculate and plot the relative Mean Strike Rate (SR) for each
###   batsman for ODI or Twenty20 batsmen
### Aliases: relativeBatsmanSRODTT
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <batsman>.csv obtained with getPlayerDataOD() or getPlayerTT()
#sehwag <-getPlayerData(35263,dir="./mytest", file="sehwag.csv",
#type="batting", homeOrAway=c(1,2),result=c(1,2,4))

# Retrieve the file path of a data file installed with cricketr
sehwag <- system.file("data", "sehwag.csv", package = "cricketr")
devilliers <- system.file("data", "devilliers.csv", package = "cricketr")
gayle <- system.file("data", "gayle.csv", package = "cricketr")
maxwell <- system.file("data", "maxwell.csv", package = "cricketr")

batsmen <- list(sehwag,devilliers,gayle,maxwell)
names <- list("Sehwag","Devilliers","Gayle","Maxwell")
relativeBatsmanSRODTT(batsmen,names)

# Note: This example uses the /data directory for the files. However
# you can use any directory as long as the data files exists in that directory.



