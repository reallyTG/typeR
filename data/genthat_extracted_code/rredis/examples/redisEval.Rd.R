library(rredis)


### Name: redisEval
### Title: Evaluate a Lua script in the Redis server.
### Aliases: redisEval

### ** Examples

## Not run: 
##D redisConnect()
##D redisEval("return redis.call('set','foo','bar')")
##D 
##D # Supply a key argument to the script
##D redisEval("return redis.call('set',KEYS[1],'bar')", "foo")
##D 
##D # Supply a key and other arguments to the script
##D redisEval("return redis.call('set',KEYS[1],ARGV[1])", "foo", pi)
## End(Not run)



