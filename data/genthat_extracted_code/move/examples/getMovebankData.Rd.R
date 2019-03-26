library(move)


### Name: getMovebankData
### Title: Download data from Movebank
### Aliases: getMovebankData getMovebankData,ANY,ANY,MovebankLogin-method
###   getMovebankData,ANY,ANY,missing-method
###   getMovebankData,ANY,missing,missing-method
###   getMovebankData,character,ANY,MovebankLogin-method
###   getMovebankData,numeric,character,MovebankLogin-method
###   getMovebankData,numeric,missing,MovebankLogin-method
###   getMovebankData,numeric,numeric,MovebankLogin-method

### ** Examples

## Not run: 
##D # obtain a login
##D login<-movebankLogin()
##D 
##D # returns a MoveStack object from the specified study
##D getMovebankData(study="BCI Ocelot", login=login) 
##D 
##D # returns a Move object (there is only one individual in this study)
##D getMovebankData(study="BCI Agouti", login=login) 
##D 
##D # returns a MoveStack with two individuals
##D getMovebankData(study=123413, animalName=c("Mancha","Yara"), login=login) 
##D 
##D # Get a specific timerange, eg: all positions untill "2003-05-06 19:45:10.000"
##D (ocelots <- getMovebankData(study=123413, animalName=c("Mancha","Yara"), 
##D                             login=login, timestamp_end="20030506194510000"))
##D 
##D timestamps(ocelots)
## End(Not run)



