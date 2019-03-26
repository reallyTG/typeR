library(TSMySQL)


### Name: TSdbiMethods
### Title: TSdbi MySQL Methods
### Aliases: MySQL TSconnect,MySQLConnection,missing-method
###   TSget,character,TSMySQLConnection-method
###   TSput,ANY,character,TSMySQLConnection-method
###   TSdelete,character,TSMySQLConnection-method
###   TSdescription,character,TSMySQLConnection-method
###   TSdoc,character,TSMySQLConnection-method
###   TSlabel,character,TSMySQLConnection-method
###   TSsource,character,TSMySQLConnection-method
###   TSdates,character,TSMySQLConnection-method
###   TSvintages,TSMySQLConnection-method TSMySQLConnection-class
### Keywords: ts

### ** Examples

    require("tfplot")
    ## Not run: 
##D       conInit <- RMySQL::dbConnect(RMySQL::MySQL(), dbname="test")
##D       TSsql::createTSdbTables(conInit, index=FALSE)
##D       con <- TSconnect("MySQL", dbname="test")
##D       z <- ts(rnorm(100), start=c(1975,1), frequency=12)
##D       seriesNames(z) <- "random1"
##D       if(TSexists("random1", con)) TSreplace(z, con) else
##D       TSput(z, con)
##D       z1 <- TSget("random1", con)
##D       tfplot(z1)
##D       z <- ts(matrix(rnorm(100),50,2), start=c(1975,1), frequency=4)
##D       seriesNames(z) <- c("random2","random3")
##D       if(TSexists("random2", con) |
##D          TSexists("random3", con) ) TSreplace(z, con) else TSput(z, con)
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
##D       con <- try(TSconnect("MySQL", dbname="ets"))
##D       if(!inherits(con, "try-error")){
##D           TSmeta("B103", con)
##D           z1 <- TSget("B103", con)
##D           tfplot(z1)
##D           z2 <- TSget(c("B103", "B104"), con)
##D           tfplot(z2)
##D           options(TSconnection=con)
##D           TSmeta("B103")
##D           z2 <- TSget(c("B103","B104"))
##D           TSmeta(z2)
##D           TSdates("D1", con)
##D           TSdates("B103", con)
##D           TSdates(c("D1","B103","B104"), con)
##D           z <- TSdates(c("D1","B103","B104"))
##D           print(z)
##D           start(z)
##D           end(z)
##D           }
##D       
## End(Not run)



