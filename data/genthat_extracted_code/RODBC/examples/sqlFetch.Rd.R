library(RODBC)


### Name: sqlFetch
### Title: Reading Tables from ODBC Databases
### Aliases: sqlFetch sqlFetchMore
### Keywords: IO database

### ** Examples

## Not run: 
##D channel <- odbcConnect("test")
##D sqlSave(channel, USArrests)
##D sqlFetch(channel, "USArrests") # get the lot
##D sqlFetch(channel, "USArrests", max = 20, rows_at_time = 10)
##D sqlFetchMore(channel, max = 20)
##D sqlFetchMore(channel) # get the rest
##D sqlDrop(channel, "USArrests") 
##D close(channel)
## End(Not run)


