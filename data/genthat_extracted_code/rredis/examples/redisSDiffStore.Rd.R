library(rredis)


### Name: redisSDiffStore
### Title: Store the difference of two or more sets.
### Aliases: redisSDiffStore

### ** Examples

## Not run: 
##D redisConnect()
##D redisSAdd('A',1)
##D redisSAdd('A',2)
##D redisSAdd('A',3)
##D redisSAdd('B',2)
##D redisSDiffStore('C','A','B')
## End(Not run)



