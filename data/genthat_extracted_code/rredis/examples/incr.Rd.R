library(rredis)


### Name: Increment, Decrement functions
### Title: Increment or decrement Redis values.
### Aliases: redisIncr redisIncrBy redisIncrByFloat redisDecr redisDecrBy

### ** Examples

## Not run: 
##D redisSet('x',charToRaw('5'))  # Note the value must be a raw string!
##D redisIncr('x')
##D redisIncrBy('x','3')
##D redisIncrBy('x',3)  # also works
##D redisIncrByFloat('x',pi)
##D redisDecr('x')
##D redisDecrBy('x',3)
## End(Not run)



