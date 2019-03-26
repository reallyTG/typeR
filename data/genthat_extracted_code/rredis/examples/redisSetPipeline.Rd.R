library(rredis)


### Name: redisSetPipeline
### Title: Set the Redis message blocking state.
### Aliases: redisSetBlocking redisSetPipeline

### ** Examples

## Not run: 
##D redisConnect()
##D redisSetBlocking(FALSE)
##D redisLPush('x',pi)
##D redisLPush('x',exp(1))
##D redisGetResponse()
##D redisSetBlocking(TRUE)
## End(Not run)



