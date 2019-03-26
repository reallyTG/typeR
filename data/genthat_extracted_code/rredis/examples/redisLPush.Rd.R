library(rredis)


### Name: redisLPush
### Title: Add a value to the head tail of a list.
### Aliases: redisLPush redisRPush

### ** Examples

## Not run: 
##D redisConnect()
##D redisLPush('x',1)
##D redisLPush('x',2)
##D redisLPush('x',3)
##D redisRPush('x',11)
##D redisRPush('x',21)
##D redisRPush('x',31)
##D redisLLen('x')
## End(Not run)



