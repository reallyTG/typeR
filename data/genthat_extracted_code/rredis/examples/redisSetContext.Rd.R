library(rredis)


### Name: redisSetContext
### Title: redisSetContext
### Aliases: redisSetContext redisGetContext

### ** Examples

## Not run: 
##D # Open a connection to a Redis server on HOST1 and store its context:
##D HOST1 <- redisConnect(host='HOST1', returnRef=TRUE)
##D print(redisInfo())
##D 
##D # Initiate a new Redis context:
##D HOST2 <- redisConnect(host='HOST2', returnRef=TRUE)
##D # The connection to HOST2 is now active:
##D print(redisInfo())
##D 
##D # We may now switch back and forth between the two active connections:
##D redisSetContext(HOST1)
##D print(redisInfo())
##D redisSetContext(HOST2)
##D print(redisInfo())
##D redisClose()
##D redisSetContext(HOST1)
##D redisClose()
## End(Not run)



