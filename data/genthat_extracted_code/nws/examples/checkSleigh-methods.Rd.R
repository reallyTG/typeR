library(nws)


### Name: checkSleigh
### Title: Number of Results Pending From Sleigh
### Aliases: checkSleigh checkSleigh-methods
###   checkSleigh,sleighPending-method
### Keywords: methods

### ** Examples

## Not run: 
##D eo = list(blocking=0)
##D s = sleigh()
##D sp = eachElem(s, function(x) {Sys.sleep(100); x}, list(1:10), eo=eo) 
##D checkSleigh(sp)  
## End(Not run)



