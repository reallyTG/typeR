library(RODBC)


### Name: sqlSave
### Title: Write a Data Frame to a Table in an ODBC Database
### Aliases: sqlSave sqlUpdate
### Keywords: IO database

### ** Examples

## Not run: 
##D channel <- odbcConnect("test")
##D sqlSave(channel, USArrests, rownames = "state", addPK=TRUE)
##D sqlFetch(channel, "USArrests", rownames = "state") # get the lot
##D foo <- cbind(state=row.names(USArrests), USArrests)[1:3, c(1,3)]
##D foo[1,2] <- 222
##D sqlUpdate(channel, foo, "USArrests")
##D sqlFetch(channel, "USArrests", rownames = "state", max = 5)
##D sqlDrop(channel, "USArrests") 
##D close(channel)
## End(Not run)


