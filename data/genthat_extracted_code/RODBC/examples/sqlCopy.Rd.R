library(RODBC)


### Name: sqlCopy
### Title: ODBC Copy
### Aliases: sqlCopy sqlCopyTable
### Keywords: IO database

### ** Examples
## Not run: 
##D ## example for a l/casing DBMS
##D sqlSave(channel, USArrests, rownames = "state")
##D query <- paste("select state, murder from usarrests",
##D                "where rape > 30", "order by murder")
##D sqlCopy(channel, query, "HighRape", rownames = FALSE)
##D sqlFetch(channel, "HighRape", rownames = "state", max = 5)
##D sqlDrop(channel, "HighRape")
## End(Not run)


