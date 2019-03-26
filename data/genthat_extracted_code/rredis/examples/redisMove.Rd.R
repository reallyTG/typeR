library(rredis)


### Name: redisMove
### Title: Move the specified key/value pair to another database.
### Aliases: redisMove

### ** Examples

## Not run: 
##D redisConnect()
##D redisSelect(1)
##D redisSet('x',5)
##D redisMove('x',2)
##D redisSelect(2)
##D redisGet('x')
## End(Not run)



