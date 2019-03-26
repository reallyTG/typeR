library(rredis)


### Name: redisSRandMember
### Title: Choose a random element from a set
### Aliases: redisSRandMember

### ** Examples

## Not run: 
##D redisConnect()
##D redisSAdd('set',1)
##D redisSAdd('set',2)
##D redisSAdd('set',3)
##D redisSRandMember('set')
## End(Not run)



