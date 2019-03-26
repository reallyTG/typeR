library(PivotalR)


### Name: delete
### Title: Safely delete a 'db.obj' object or a table/view in the database
### Aliases: delete delete,db.data.frame-method delete,db.Rquery-method
###   delete,character-method delete,arima.css.madlib-method
###   delete,summary.madlib-method delete,lm.madlib-method
###   delete,lm.madlib.grps-method delete,logregr.madlib-method
###   delete,logregr.madlib.grps-method delete,bagging.model-method
###   delete,elnet.madlib-method delete,dt.madlib-method
###   delete,dt.madlib.grps-method
### Keywords: methods database utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D delete("abalone", cid, is.temp = TRUE)
##D 
##D delete("abalone", cid, is.temp = FALSE)
##D 
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid)
##D 
##D lk(x, 10)
##D 
##D y <- as.db.data.frame(abalone, "abalone", conn.id = cid, is.temp = TRUE)
##D 
##D lk(y, 10)
##D 
##D db.existsObject("abalone", cid, is.temp = TRUE)
##D 
##D db.existsObject("abalone", cid, is.temp = FALSE)
##D 
##D delete("abalone", cid)
##D 
##D p <- db.objects()
##D p[p == "abalone"]
##D 
##D ## Example: delete multiple tables
##D ## all table in public schema start with "ornste"
##D to.delete <- db.objects("public.ornste", conn.id = cid)
##D for (table.name in to.delete) delete(table.name, conn.id = cid)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



