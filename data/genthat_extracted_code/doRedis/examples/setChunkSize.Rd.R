library(doRedis)


### Name: setChunkSize
### Title: setChunkSize
### Aliases: setChunkSize

### ** Examples

## Not run: 
##D require('doRedis')
##D setChunkSize(10)
##D 
##D ## Override the default value in a loop as shown in the following example:
##D foreach(j=1:1000, .options.redis=list(chunkSize=100)) ##D 
## End(Not run)



