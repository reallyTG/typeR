library(PivotalR)


### Name: cbind2-methods
### Title: Combine two 'db.obj' Objects by Columns
### Aliases: as.list,db.obj-method cbind cbind2 cbind2,db.obj,db.obj-method
### Keywords: data operation utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame "abalone"
##D delete('abalone', conn.id = cid)
##D x <- as.db.data.frame(abalone, 'abalone', conn.id = cid, verbose = FALSE)
##D 
##D fit <- madlib.lm(rings ~ . - id - sex, data = x)
##D 
##D ## create a db.Rquery object that has two columns
##D z <- cbind(x$rings, predict(fit, x))
##D 
##D ## plot prediction v.s. real value
##D plot(lookat(z, 100))
##D 
##D ## expand the db.obj
##D unlist(Map(function(x)
##D                if (col.types(x) == "text")
##D                    paste(lk(unique(x)), collapse="-", sep="")
##D                else
##D                    lk(mean(x))),
##D            as.list(x))
##D 
##D ## sum of all columns (excluding the 2nd column)
##D Reduce(function(left, right) left + right, as.list(x[-2]))
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



