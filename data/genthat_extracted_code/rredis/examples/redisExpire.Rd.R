library(rredis)


### Name: redisExpire
### Title: Set a timeout on the specified key.
### Aliases: redisExpire redisPexpire

### ** Examples

## Not run: 
##D redisConnect()
##D redisLPush('x',runif(5))
##D redisExpire('x', 3)
## End(Not run)



