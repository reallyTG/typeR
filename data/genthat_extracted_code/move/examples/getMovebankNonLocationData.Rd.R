library(move)


### Name: getMovebankNonLocationData
### Title: Download non-location data from Movebank
### Aliases: getMovebankNonLocationData
###   getMovebankNonLocationData,ANY,ANY,ANY,missing-method
###   getMovebankNonLocationData,ANY,ANY,missing,missing-method
###   getMovebankNonLocationData,ANY,missing,missing,missing-method
###   getMovebankNonLocationData,character,ANY,ANY,MovebankLogin-method
###   getMovebankNonLocationData,numeric,missing,ANY,MovebankLogin-method
###   getMovebankNonLocationData,numeric,character,ANY,MovebankLogin-method
###   getMovebankNonLocationData,numeric,numeric,missing,MovebankLogin-method
###   getMovebankNonLocationData,numeric,numeric,character,MovebankLogin-method
###   getMovebankNonLocationData,numeric,numeric,numeric,MovebankLogin-method

### ** Examples

## Not run: 
##D ## first create the login object 
##D login <- movebankLogin()
##D 
##D ## get acceleration data for one individual
##D str(getMovebankNonLocationData(study=74496970 , sensorID="Acceleration",
##D                                animalName="DER AR439", login=login))
##D 
##D ## get acceleration data for one individual after the "2013-07-12 06:50:07.000"
##D str(getMovebankNonLocationData(study=74496970 , sensorID="Acceleration", animalName="DER AR439", 
##D                                login=login, timestamp_start="20130712065007000"))
##D 
##D # get acceleration data for all individuals of the study between 
##D # the "2013-08-15 15:00:00.000" and "2013-08-15 15:01:00.000"
##D str(getMovebankNonLocationData(study=74496970 , sensorID=2365683, 
##D                                login=login, timestamp_start="20130815150000000", 
##D                                timestamp_end="20130815150100000"))
## End(Not run)



