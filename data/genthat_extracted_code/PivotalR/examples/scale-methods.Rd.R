library(PivotalR)


### Name: scale
### Title: Scaling and centering of tables
### Aliases: scale,db.obj-method
### Keywords: methods math stats

### ** Examples

## Not run: 
##D ## help("scale,db.obj-method") # display this doc
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname)
##D 
##D x <- as.db.data.frame(abalone, conn.id = cid)
##D lk(x, 10)
##D 
##D s <- scale(x[-c(1,2)]) # scale all numeric columns
##D 
##D centers <- attr(s, "scaled:center")
##D scales <- attr(s, "scaled:scale")
##D 
##D ## create the scaled table
##D delete("scaled_abalone")
##D y <- as.db.data.frame(s, "scaled_abalone")
##D 
##D lk(y, 10)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



