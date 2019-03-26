library(nws)


### Name: status
### Title: Check Status of Sleigh Workers
### Aliases: status status-methods status,sleigh-method
### Keywords: methods

### ** Examples

## Not run: 
##D # example 1
##D # one available machine and one non-existent machine
##D s <- sleigh(c('localhost', 'noname'))
##D slist <- status(s)
##D # slist$numWorkers = the number of worker started
##D # slist$closed = whether the worker group is closed or not. 
##D 
##D # example 2
##D # check the status of worker group after 20 seconds
##D slist <- status(s, timeout=20)
##D 
##D # example 3
##D # close the group after 10 seconds, regardless of whether
##D # all workers have started up successfully.
##D slist <- status(s, closeGroup=TRUE, timeout=10)
## End(Not run)



