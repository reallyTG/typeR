library(PivotalR)


### Name: Extract-Replace-methods
### Title: Extract or replace a part of 'db.obj' objects
### Aliases: 'Extraction methods' 'Replacement methods' $,db.obj-method
###   $<-,db.obj,character-method $<-,db.obj,integer-method
###   $<-,db.obj,numeric-method $<-,db.obj,db.Rquery-method
###   $<-,db.obj,logical-method [,db.obj,ANY,ANY,ANY-method [<-.db.obj
###   [[,db.obj-method [[<-,db.obj,ANY,ANY,character-method
###   [[<-,db.obj,ANY,ANY,integer-method [[<-,db.obj,ANY,ANY,numeric-method
###   [[<-,db.obj,ANY,ANY,db.Rquery-method
###   [[<-,db.obj,ANY,ANY,logical-method
### Keywords: data operation utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D x$area <- x[["length"]] * x[,"height"] # add a new column
##D 
##D y <- x[,-c(1,2)] # use all columns except the first two
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



