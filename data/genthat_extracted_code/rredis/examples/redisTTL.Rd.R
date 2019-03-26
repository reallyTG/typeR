library(rredis)


### Name: redisTTL
### Title: Return the time to live for a key set to expire.
### Aliases: redisTTL redisPTTL

### ** Examples

## Not run: 
##D redisConnect()
##D redisSet('x',5)
##D redisExpire('x',100)
##D redisTTL('x')
## End(Not run)



