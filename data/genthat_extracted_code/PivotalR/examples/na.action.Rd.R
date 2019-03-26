library(PivotalR)


### Name: na.action
### Title: Functions for filtering 'NA' values in data
### Aliases: na.omit,db.obj-method
### Keywords: utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D delete("abalone", conn.id = cid)
##D dat <- as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D 
##D madlib.lm(rings ~ . - sex - id, data = dat, na.action = na.omit)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



