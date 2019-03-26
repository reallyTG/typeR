library(rredis)


### Name: redisPersist
### Title: Clear expiration flags for a key
### Aliases: redisPersist

### ** Examples

## Not run: 
##D redisSet('x',runif(5))
##D redisExpire('x',10)
##D redisPersist('x')
## End(Not run)



