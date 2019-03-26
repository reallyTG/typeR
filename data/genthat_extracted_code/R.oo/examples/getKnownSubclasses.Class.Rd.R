library(R.oo)


### Name: getKnownSubclasses.Class
### Title: Gets all subclasses that are currently loaded
### Aliases: getKnownSubclasses.Class Class.getKnownSubclasses
###   getKnownSubclasses,Class-method
### Keywords: internal methods programming

### ** Examples

  ## Not run: 
##D   # Due to a bug in R CMD check (R v1.7.1) the MicroarrayData$read() call
##D   # below will call getKnownSubclasses(), which will generate
##D   #   "Error in exists(objectName, mode = "function") :
##D   #	   [2003-07-07 23:32:41] Exception: F used instead of FALSE"
##D   # Note that the example still work, just not in R CMD check
##D 
##D   print(getKnownSubclasses(Exception))
##D   
## End(Not run)
  ## Not run: 
##D   returns
##D   [1] "Exception" "try-error" "Object"
##D   
## End(Not run)



