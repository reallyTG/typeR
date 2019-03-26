library(rredis)


### Name: redisSInter
### Title: Find and return the intersection of two or more sets.
### Aliases: redisSInter

### ** Examples

## Not run: 
##D redisConnect()
##D redisSAdd('A',1)
##D redisSAdd('A',2)
##D redisSAdd('A',3)
##D redisSAdd('B',2)
##D redisSInter('A','B')
##D redisSInter(c('A','B'))
##D redisSInter(list('A','B'))
## End(Not run)



