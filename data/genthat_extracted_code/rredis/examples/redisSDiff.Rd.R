library(rredis)


### Name: redisSDiff
### Title: Return the difference of two or more sets.
### Aliases: redisSDiff

### ** Examples

## Not run: 
##D redisConnect()
##D redisSAdd('A',1)
##D redisSAdd('A',2)
##D redisSAdd('B',4)
##D redisSDiff('A','B')
##D redisSDiff(c('A','B'))
##D redisSDiff(list('A','B'))
## End(Not run)



