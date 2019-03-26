library(TSSQLite)


### Name: TSdbiMethods
### Title: TSdbi SQLite Methods
### Aliases: SQLite TSconnect,SQLiteConnection,missing-method
###   TSget,character,TSSQLiteConnection-method
###   TSput,ANY,character,TSSQLiteConnection-method
###   TSdelete,character,TSSQLiteConnection-method
###   TSdescription,character,TSSQLiteConnection-method
###   TSdoc,character,TSSQLiteConnection-method
###   TSlabel,character,TSSQLiteConnection-method
###   TSsource,character,TSSQLiteConnection-method
###   TSdates,character,TSSQLiteConnection-method
###   TSvintages,TSSQLiteConnection-method print,TSSQLiteConnection-method
###   TSSQLiteConnection-class
### Keywords: ts

### ** Examples

    require("tfplot")
    dbfile <- tempfile()
    setup <- RSQLite::dbConnect(RSQLite::SQLite(), dbname=dbfile)
    TSsql::createTSdbTables(setup, index=FALSE)
    
    con <- TSconnect("SQLite", dbname=dbfile)

    z <- ts(rnorm(100), start=c(1975,1), frequency=12)
    seriesNames(z) <- "random1"
    if(TSexists("random1", con)) TSreplace(z, con) else
    TSput(z, con)
    z1 <- TSget("random1", con)
    tfplot(z1)

    z <- ts(matrix(rnorm(100),50,2), start=c(1975,1), frequency=4)
    seriesNames(z) <- c("random2","random3")
    if(TSexists("random2", con) |
       TSexists("random3", con) ) TSreplace(z, con) else
    TSput(z, con)

    z2 <- TSget("random2", con)
    tfplot(z2)
    TSdates("D1", con)
    TSdates("random2", con)
    TSdates(c("random1","random2","random3"), con)
    TSmeta("random2", con)

    options(TSconnection=con)
    z2 <- TSget(c("random2","random3"))
    z <- TSdates(c("D1","random2","random3"))
    print(z)
    TSmeta("random2")
    TSdelete("random1", con)
    TSdelete("random2")
    
    unlink(dbfile)



