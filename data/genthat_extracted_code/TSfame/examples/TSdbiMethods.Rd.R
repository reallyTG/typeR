library(TSfame)


### Name: TSfameMethods
### Title: TSdbi fame Methods
### Aliases: fameLocal fameServer
###   TSconnect,TSfameLocalConnection,missing-method
###   TSget,character,TSfameLocalConnection-method
###   TSput,ANY,character,TSfameLocalConnection-method
###   TSdelete,character,TSfameLocalConnection-method
###   TSdoc,character,TSfameLocalConnection-method
###   TSdescription,character,TSfameLocalConnection-method
###   TSlabel,character,TSfameLocalConnection-method
###   TSsource,character,TSfameLocalConnection-method
###   TSdates,character,TSfameLocalConnection-method
###   TSexists,character,TSfameLocalConnection-method
###   TSvintages,TSfameLocalConnection-method
###   TSconnect,TSfameServerConnection,missing-method
###   TSget,character,TSfameServerConnection-method
###   TSput,ANY,character,TSfameServerConnection-method
###   TSdelete,character,TSfameServerConnection-method
###   TSdoc,character,TSfameServerConnection-method
###   TSdescription,character,TSfameServerConnection-method
###   TSlabel,character,TSfameServerConnection-method
###   TSsource,character,TSfameServerConnection-method
###   TSdates,character,TSfameServerConnection-method
###   TSexists,character,TSfameServerConnection-method
###   TSvintages,TSfameServerConnection-method TSfameLocalConnection-class
###   TSfameServerConnection-class
### Keywords: ts

### ** Examples

   require("tfplot")
   con <- try(TSconnect(dbDriver("fame"), dbname="test.db"))
    if(! inherits(con, "try-error")) {
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
      dbDisconnect(con)
      }



