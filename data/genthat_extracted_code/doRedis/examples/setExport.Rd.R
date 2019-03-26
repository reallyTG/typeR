library(doRedis)


### Name: setExport
### Title: setExport
### Aliases: setExport

### ** Examples

## Not run: 
##D require("doRedis")
##D registerDoRedis("work queue")
##D startLocalWorkers(n=1, queue="work queue")
##D 
##D f <- function() pi
##D 
##D foreach(1) ##D 
##D # Returns the error:
##D # Error in eval(call("f")) : task 1 failed - could not find function "f"
##D 
##D # Manuall export the symbol f:
##D setExport("f")
##D foreach(1) ##D 
##D # Ok then.
##D #[[1]]
##D #[1] 3.141593
##D removeQueue("work queue")
## End(Not run)



