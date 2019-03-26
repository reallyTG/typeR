library(rredis)


### Name: redisRPopLPush
### Title: Remove the tail from a list, pushing to another.
### Aliases: redisRPopLPush

### ** Examples

## Not run: 
##D redisConnect()
##D redisLPush('x',1)
##D redisLPush('x',2)
##D redisLPush('x',3)
##D redisRPopLPush('x','x')
##D redisRPopLPush('x','x')
## End(Not run)



