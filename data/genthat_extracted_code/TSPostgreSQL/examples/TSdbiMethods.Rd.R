library(TSPostgreSQL)


### Name: TSdbiMethods
### Title: TSdbi PostgreSQL Methods
### Aliases: PostgreSQL TSconnect,PostgreSQLConnection,missing-method
###   TSget,character,TSPostgreSQLConnection-method
###   TSput,ANY,character,TSPostgreSQLConnection-method
###   TSdelete,character,TSPostgreSQLConnection-method
###   TSdescription,character,TSPostgreSQLConnection-method
###   TSdoc,character,TSPostgreSQLConnection-method
###   TSlabel,character,TSPostgreSQLConnection-method
###   TSsource,character,TSPostgreSQLConnection-method
###   TSdates,character,TSPostgreSQLConnection-method
###   TSvintages,TSPostgreSQLConnection-method TSPostgreSQLConnection-class
### Keywords: ts

### ** Examples

    require("tfplot")
    ## Not run: 
##D       conInit <- RPostgreSQL::dbConnect("PostgreSQL", dbname="test")
##D       TSsql::createTSdbTables(conInit, index=FALSE)
##D       con <- TSconnect("PostgreSQL", dbname="test")
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
##D       TSsql::removeTSdbTables(con,
##D                      yesIknowWhatIamDoing=TRUE, ToLower=TRUE) 
##D      
## End(Not run)



