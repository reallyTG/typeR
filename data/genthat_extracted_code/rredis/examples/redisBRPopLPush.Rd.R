library(rredis)


### Name: redisBRPopLPush
### Title: Remove the tail from a list, blocking if it does not exist,
###   pushing to another.
### Aliases: redisBRPopLPush

### ** Examples

## Not run: 
##D redisConnect()
##D redisLPush('x',1)
##D redisBRPopLPush('x','x')
## End(Not run)



