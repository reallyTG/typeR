library(rredis)


### Name: redisSUnionStore
### Title: Store the union of two or more sets.
### Aliases: redisSUnionStore

### ** Examples

## Not run: 
##D redisConnect()
##D redisSAdd('A',1)
##D redisSAdd('A',2)
##D redisSAdd('A',3)
##D redisSAdd('B',2)
##D redisSUnionStore('C','A','B')
## End(Not run)



