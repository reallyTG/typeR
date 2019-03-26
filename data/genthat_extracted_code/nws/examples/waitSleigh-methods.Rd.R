library(nws)


### Name: waitSleigh
### Title: Wait for Results from Sleigh
### Aliases: waitSleigh waitSleigh-methods waitSleigh,sleighPending-method
### Keywords: methods

### ** Examples

## Not run: 
##D s = sleigh()
##D eo = list(blocking=0)
##D sp = eachWorker(s, function() {Sys.sleep(100)}, eo=eo) 
##D waitSleigh(sp)  # wait on workers. Each worker sleeps for 100 seconds
## End(Not run)



