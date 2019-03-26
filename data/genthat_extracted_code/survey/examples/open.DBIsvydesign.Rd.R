library(survey)


### Name: open.DBIsvydesign
### Title: Open and close DBI connections
### Aliases: open.DBIsvydesign close.DBIsvydesign open.ODBCsvydesign
###   close.ODBCsvydesign
### Keywords: survey

### ** Examples

## Not run: 
##D library(RSQLite)
##D dbclus1<-svydesign(id=~dnum, weights=~pw, fpc=~fpc,
##D data="apiclus1",dbtype="SQLite",
##D dbname=system.file("api.db",package="survey"))
##D 
##D dbclus1
##D close(dbclus1)
##D dbclus1
##D try(svymean(~api00, dbclus1))
##D 
##D dbclus1<-open(dbclus1)
##D open(dbclus1)
##D svymean(~api00, dbclus1)
## End(Not run)



