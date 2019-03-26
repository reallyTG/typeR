library(rredis)


### Name: redisSUnion
### Title: Return the union of two or more sets.
### Aliases: redisSUnion

### ** Examples

## Not run: 
##D redisConnect()
##D redisSAdd('A',1)
##D redisSAdd('A',2)
##D redisSAdd('B',4)
##D redisSUnion('A','B')
##D redisSUnion(c('A','B'))
##D redisSUnion(list('A','B'))
## End(Not run)



