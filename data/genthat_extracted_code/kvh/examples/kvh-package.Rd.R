library(kvh)


### Name: kvh-package
### Title: Write/read KVH (key-value hierarchy) file
### Aliases: kvh-package kvh
### Keywords: kvh-format

### ** Examples

  ## Not run: 
##D      # prepare object to write to kvh file
##D      obj=list(x=structure(1:3, names=letters[1:3]), R=R.version)
##D      # write it
##D      obj2kvh(obj, "test", "test.kvh") # will create test.kvh file
##D      # read it back
##D      l=kvh_read("test.kvh")
##D      # check a field
##D      l$test$x # NB. it has a character values put in a list not a numeric vector as it was in obj.
##D   
## End(Not run)



