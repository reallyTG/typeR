library(couchDB)


### Name: couch_new_object
### Title: New couchDB document
### Aliases: couch_new_object

### ** Examples

## Not run: 
##D  
##D    # This code creates a document containing a small list for storage in 
##D    # the "localhost" database with the key "testDoc".
##D    myDoc <- couch_new_object(list(a = 1,b = 2),"localhost","testDoc") 
##D    
##D    # Same as above but with json entered directly (not recommended).
##D    myDoc <- couch_new_object('{"a":1,"b":2}',"localhost","testDoc")
## End(Not run) 



