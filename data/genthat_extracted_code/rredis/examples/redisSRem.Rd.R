library(rredis)


### Name: redisSRem
### Title: Remove an element from a set.
### Aliases: redisSRem

### ** Examples

## Not run: 
##D redisConnect()
##D redisSAdd('set', 5)
##D redisSAdd('set', 7)
##D redisSMembers('set')
##D redisSRem('set',5)
##D redisSMembers('set')
## End(Not run)



