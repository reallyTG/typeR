library(cricketr)


### Name: getPlayerDataTT
### Title: Get the Twenty20 International player data from ESPN Cricinfo
###   based on specific inputs and store in a file in a given directory~
### Aliases: getPlayerDataTT
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D # Only away. Get data only for won and lost innings
##D kohli <-getPlayerDataTT(253802,dir="../cricketr/data", file="kohli1.csv",
##D type="batting")
##D 
##D # Get bowling data and store in file for future
##D ashwin <- getPlayerDataTT(26421,dir="../cricketr/data",file="ashwin1.csv",
##D type="bowling")
##D 
##D kohli <-getPlayerDataTT(253802,opposition = 2,host=2,dir="../cricketr/data", 
##D file="kohli1.csv",type="batting")
## End(Not run)



