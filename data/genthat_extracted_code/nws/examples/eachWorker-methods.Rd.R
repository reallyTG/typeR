library(nws)


### Name: eachWorker
### Title: Execute a Function in Parallel on all Workers of a Sleigh
### Aliases: eachWorker-methods eachWorker,sleigh-method eachWorker
### Keywords: methods

### ** Examples

  ## Not run: 
##D # create a sleigh
##D s <- sleigh()
##D 
##D # assign to global variable x on each worker
##D eachWorker(s, function() x <<- 1)
##D 
##D # get a listing of each worker's global environment
##D eachWorker(s, function() ls(globalenv()))
##D 
##D # get system info from each worker
##D eachWorker(s, Sys.info)
##D 
##D # load MASS package on each worker
##D eachWorker(s, function() library(MASS))
##D 
##D # non-blocking example using simple NWS operations
##D sp <- eachWorker(s, function() nwsFind(SleighNws, 'hello'), eo=list(blocking=FALSE))
##D nwsStore(s@nws, 'hello', 'world')
##D waitSleigh(sp)	
##D   
## End(Not run)



