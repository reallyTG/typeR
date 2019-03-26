library(doRedis)


### Name: setGetTask
### Title: setGetTask
### Aliases: setGetTask

### ** Examples

## Not run: 
##D require('doRedis')
##D 
##D # The default getTask function defines a Redis Lua script that returns the first
##D # listed task or NULL:sk <-  function(queue, job_id, ...)
##D 
##D getTask <- function(queue, job_id, ...)
##D {
##D   key <- sprintf("##D 
##D   redisEval("local x=redis.call('hkeys',KEYS[1])[1];
##D              if x==nil then return nil end;
##D              local ans=redis.call('hget',KEYS[1],x);
##D              redis.call('hdel',KEYS[1],x);i
##D              return ans",key)
##D }
##D setGetTask(getTask)
## End(Not run)



