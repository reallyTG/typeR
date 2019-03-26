library(doRedis)


### Name: startLocalWorkers
### Title: startLocalWorkers
### Aliases: startLocalWorkers

### ** Examples

## Not run: 
##D require('doRedis')
##D registerDoRedis('jobs')
##D startLocalWorkers(n=2, queue='jobs')
##D print(getDoParWorkers())
##D foreach(j=1:10,.combine=sum,.multicombine=TRUE) %dopar%
##D           4*sum((runif(1000000)^2 + runif(1000000)^2)<1)/10000000
##D removeQueue('jobs')
## End(Not run)



