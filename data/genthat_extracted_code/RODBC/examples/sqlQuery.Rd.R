library(RODBC)


### Name: sqlQuery
### Title: Query an ODBC Database
### Aliases: sqlQuery sqlGetResults
### Keywords: IO database

### ** Examples

## Not run: 
##D channel <- odbcConnect("test")
##D sqlSave(channel, USArrests, rownames = "State", verbose = TRUE)
##D # options(dec=".") # optional, if DBMS is not locale-aware or set to ASCII
##D ## note case of State, Murder, Rape are DBMS-dependent,
##D ## and some drivers need column and table names double-quoted.
##D sqlQuery(channel, paste("select State, Murder from USArrests",
##D                         "where Rape > 30 order by Murder"))
##D close(channel)
## End(Not run)


