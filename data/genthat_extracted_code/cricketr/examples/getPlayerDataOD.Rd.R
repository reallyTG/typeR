library(cricketr)


### Name: getPlayerDataOD
### Title: Get the One day player data from ESPN Cricinfo based on specific
###   inputs and store in a file in a given directory
### Aliases: getPlayerDataOD
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Not run: 
##D # Both home and away. Result = won,lost and drawn
##D sehwag <-getPlayerDataOD(35263,dir="../cricketr/data", file="sehwag1.csv",
##D type="batting", homeOrAway=c(1,2),result=c(1,2,3,5))
##D 
##D # Only away. Get data only for won and lost innings
##D sehwag <-getPlayerDataOD(35263,dir="../cricketr/data", file="sehwag2.csv",
##D type="batting",homeOrAway=c(2),result=c(1,2))
##D 
##D # Get bowling data and store in file for future
##D malinga <- getPlayerData(49758,dir="../cricketr/data",file="malinga1.csv",
##D type="bowling")
##D 
##D # Get Dhoni's ODI record in Australia against Australua
##D dhoni <- getPlayerDataOD(28081,opposition = 2,host=2,dir=".",
##D file="dhoniVsAusinAusOD",type="batting")
## End(Not run)



