library(doRedis)


### Name: registerDoRedis
### Title: Register the doRedis parallel back end with foreach.
### Aliases: registerDoRedis

### ** Examples

## Not run: 
##D ## The example assumes that a Redis server is running on the local host
##D ## and standard port.
##D 
##D ## 1. Open one or more 'worker' R sessions and run:
##D require('doRedis')
##D redisWorker('jobs')
##D 
##D ## 2. Open another R session acting as a 'master' and run this simple 
##D ##    sampling approximation of pi:
##D require('doRedis')
##D registerDoRedis('jobs')
##D foreach(j=1:10,.combine=sum,.multicombine=TRUE) %dopar% 
##D           4*sum((runif(1000000)^2 + runif(1000000)^2)<1)/10000000
##D removeQueue('jobs')
## End(Not run)



