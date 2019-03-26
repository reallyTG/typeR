library(rredis)


### Name: redisSet
### Title: Store a value in Redis.
### Aliases: redisSet

### ** Examples

## Not run: 
##D # Store an R object with the key 'x':
##D redisSet('x',runif(5))
## End(Not run)
## Not run: 
##D # Store a string that can be easily read by other clients:
##D redisSet('x',charToRaw('Hello Redis clients'))
## End(Not run)



