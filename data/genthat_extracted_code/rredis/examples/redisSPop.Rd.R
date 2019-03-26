library(rredis)


### Name: redisSPop
### Title: Remove and return an element from a set.
### Aliases: redisSPop

### ** Examples

## Not run: 
##D redisConnect()
##D redisSAdd('set',runif(2))
##D redisSAdd('set',runif(3))
##D redisSAdd('set',runif(4))
##D redisSPop('set')
##D redisSPop('set')
##D redisSPop('set')
##D redisSPop('set')
## End(Not run)



