library(RMySQL)


### Name: dbGetInfo,MySQLDriver-method
### Title: Get information about a MySQL driver.
### Aliases: dbGetInfo,MySQLDriver-method
###   dbListConnections,MySQLDriver-method show,MySQLDriver-method
###   summary,MySQLDriver-method

### ** Examples

db <- RMySQL::MySQL()

db
dbGetInfo(db)
dbListConnections(db)
summary(db)



