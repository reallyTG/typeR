library(doRedis)


### Name: setTaskLabel
### Title: setTaskLabel
### Aliases: setTaskLabel

### ** Examples

## Not run: 
##D require('doRedis')
##D # The default getTask function defines a Redis Lua script that returns the first
##D # listed task or NULL:sk <-  function(queue, job_id, ...)
##D getTask <- function(queue, job_id, ...)
##D {
##D   key <- sprintf("##D 
##D   redisEval("local x=redis.call('hkeys',KEYS[1])[1];
##D              if x==nil then return nil end;
##D              local ans=redis.call('hget',KEYS[1],x);
##D              redis.call('hdel',KEYS[1],x);i
##D              return ans",key)
##D }
##D 
##D setTaskLabel(fn = I)
## End(Not run)



