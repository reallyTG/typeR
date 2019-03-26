library(PivotalR)


### Name: db.Rcrossprod-class
### Title: Class '"db.Rcrossprod"'
### Aliases: db.Rcrossprod-class
### Keywords: classes database

### ** Examples

## Not run: 
##D showClass("db.Rcrossprod")
##D 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## x points to table "abalone"
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D lookat(crossprod(x[,-c(1,2)]))
##D 
##D x$arr <- db.array(1, x$length, x$diameter)
##D 
##D lookat(crossprod(x$arr))
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



