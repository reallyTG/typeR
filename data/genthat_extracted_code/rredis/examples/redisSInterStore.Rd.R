library(rredis)


### Name: redisSInterStore
### Title: Store intersection of two or more sets.
### Aliases: redisSInterStore

### ** Examples

## Not run: 
##D redisConnect()
##D redisSAdd('A',1)
##D redisSAdd('A',2)
##D redisSAdd('A',3)
##D redisSAdd('B',2)
##D redisSInterStore('C','A','B')
## End(Not run)



