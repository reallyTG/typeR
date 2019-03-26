library(rredis)


### Name: redisLTrim
### Title: Trim a list.
### Aliases: redisLTrim

### ** Examples

## Not run: 
##D redisConnect()
##D redisLPush('x',1)
##D redisLPush('x',2)
##D redisLPush('x',3)
##D redisLTrim('x',0,1)
##D redisLRange('x',0,99)
## End(Not run)



