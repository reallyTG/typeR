library(TSodbc)


### Name: TSodbcMethods
### Title: TSdbi ODBC Methods
### Aliases: odbc TSconnect,odbcConnection,missing-method
###   TSget,character,TSodbcConnection-method
###   TSput,ANY,character,TSodbcConnection-method
###   TSdelete,character,TSodbcConnection-method
###   TSdescription,character,TSodbcConnection-method
###   TSdoc,character,TSodbcConnection-method
###   TSlabel,character,TSodbcConnection-method
###   TSsource,character,TSodbcConnection-method
###   TSdates,character,TSodbcConnection-method
###   TSvintages,TSodbcConnection-method
###   dbExistsTable,RODBC,character-method
###   dbRemoveTable,RODBC,character-method
###   dbGetQuery,RODBC,character-method dbListTables,RODBC-method
###   TSodbcConnection-class
### Keywords: ts

### ** Examples

    require("tfplot")
    ## Not run: 
##D       require("RODBC")
##D       setup <- RODBC::odbcConnect(dsn="test")
##D       TSsql::createTSdbTables(setup, index=FALSE)
##D       con <- TSconnect("odbc", dbname="test")
##D       z <- ts(rnorm(100), start=c(1975,1), frequency=12)
##D       seriesNames(z) <- "random1"
##D       if(TSexists("random1", con)) TSreplace(z, con) else
##D       TSput(z, con)
##D       z1 <- TSget("random1", con)
##D       tfplot(z1)
##D       z <- ts(matrix(rnorm(100),50,2), start=c(1975,1), frequency=4)
##D       seriesNames(z) <- c("random2","random3")
##D       if(TSexists("random2", con) |
##D          TSexists("random3", con) ) TSreplace(z, con) else
##D       TSput(z, con)
##D       z2 <- TSget("random2", con)
##D       tfplot(z2)
##D       TSdates("D1", con)
##D       TSdates("random2", con)
##D       TSdates(c("random1","random2","random3"), con)
##D       TSmeta("random2", con)
##D       options(TSconnection=con)
##D       z2 <- TSget(c("random2","random3"))
##D       z <- TSdates(c("D1","random2","random3"))
##D       print(z)
##D       TSmeta("random2")
##D       TSdelete("random1", con)
##D       TSdelete("random2")
##D       TSsql::removeTSdbTables(con, yesIknowWhatIamDoing=TRUE)
##D       dbDisconnect(con)
##D       
## End(Not run)



