library(rredis)


### Name: redisExpireAt
### Title: Set a timeout on the specified key.
### Aliases: redisExpireAt redisPexpireAt

### ** Examples

## Not run: 
##D redisConnect()
##D redisLPush('x',runif(5))
##D redisExpireAt('x', 1266209144)
## End(Not run)



