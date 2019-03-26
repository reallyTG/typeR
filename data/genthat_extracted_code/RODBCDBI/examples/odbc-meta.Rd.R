library(RODBCDBI)


### Name: odbc-meta
### Title: Database interface meta-data.
### Aliases: dbColumnInfo,ODBCResult-method dbGetInfo,ODBCResult-method
###   dbGetRowCount,ODBCResult-method dbGetStatement,ODBCResult-method
###   odbc-meta

### ** Examples

## Not run: 
##D library(DBI)
##D data(USArrests)
##D con <- dbConnect(RODBCDBI::ODBC(), dsn="test", user="sa", password="Password12!")
##D dbWriteTable(con, "t1", USArrests, overwrite=TRUE)
##D dbWriteTable(con, "t2", USArrests, overwrite=TRUE)
##D 
##D dbListTables(con)
##D 
##D rs <- dbSendQuery(con, "select * from t1 where UrbanPop >= 80")
##D dbGetStatement(rs)
##D dbHasCompleted(rs)
##D 
##D info <- dbGetInfo(rs)
##D names(info)
##D info$fields
##D 
##D dbFetch(rs, n=2)
##D dbHasCompleted(rs)
##D info <- dbGetInfo(rs)
##D info$fields
##D dbClearResult(rs)
##D 
##D # DBIConnection info
##D names(dbGetInfo(con))
##D 
##D dbDisconnect(con)
## End(Not run)



