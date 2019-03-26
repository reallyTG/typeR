library(cricketr)


### Name: cricketr-package
### Title: Analyze Cricketers Based on ESPN Cricinfo Statsguru This package
###   analyzes the performances of cricketers using ESPN Cricinfo Statsguru
###   data. The analysis can be done for Test, ODI and Twenty20 cricket for
###   both batsman & bowlers
### Aliases: cricketr-package cricketr
### Keywords: package

### ** Examples

## Not run: 
##D getPlayerData(profile,opposition="",host="",dir="./data",file="player001.csv",
##D type="batting", homeOrAway=c(1,2),result=c(1,2,4))
##D getPlayerDataOD(profile, opposition="",host="",dir = "../", file = "player001.csv", 
##D type = "batting", homeOrAway = c(1, 2, 3), result = c(1, 2, 3,5))
##D getPlayerDataTT(profile, opposition="",host="",dir = "./data", file = "player001.csv", 
##D type = "batting", homeOrAway = c(1, 2, 3), result = c(1, 2, 3,5))
##D batsmanAvgRunsGround(file, name = "A Latecut")
##D bowlerAvgWktsGround(file, name = "A Chinaman")
##D tendulkar <- system.file("data", "tendulkar.csv", package = "cricketr")
##D ganguly <- system.file("data", "ganguly.csv", package = "cricketr")
##D dravid <- system.file("data", "dravid.csv", package = "cricketr")
##D batsmen <- list(tendulkar,dravid,ganguly)
##D names <- list("Tendulkar","Dravid","Ganguly")
##D relativeBatsmanCumulativeAvgRuns(batsmen,names)
## End(Not run)



