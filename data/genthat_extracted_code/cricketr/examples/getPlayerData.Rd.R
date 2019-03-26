library(cricketr)


### Name: getPlayerData
### Title: Get the player data from ESPN Cricinfo based on specific inputs
###   and store in a file in a given directory
### Aliases: getPlayerData
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D # Both home and away. Result = won,lost and drawn
##D tendulkar <-getPlayerData(35320,dir="../cricketr/data", file="tendulkar1.csv",
##D type="batting", homeOrAway=c(1,2),result=c(1,2,4))
##D 
##D # Only away. Get data only for won and lost innings
##D tendulkar <-getPlayerData(35320,dir="../cricketr/data", file="tendulkar2.csv",
##D type="batting",homeOrAway=c(2),result=c(1,2))
##D 
##D # Get bowling data and store in file for future
##D kumble <- getPlayerData(30176,dir="../cricketr/data",file="kumble1.csv",
##D type="bowling",homeOrAway=c(1),result=c(1,2))
##D 
##D #Get the Tendulkar's Performance against Australia in Australia
##D tendulkar <-getPlayerData(35320, opposition = 2,host=2,dir=".", 
##D file="tendulkarVsAusInAus.csv",type="batting") 
## End(Not run)




