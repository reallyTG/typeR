library(archivist)


### Name: cache
### Title: Enable Caching of the Function Results with the use of Archivist
### Aliases: cache

### ** Examples

## Not run: 
##D 
##D # objects preparation
##D library("lubridate")
##D cacheRepo <- tempfile()
##D createLocalRepo( cacheRepo )
##D 
##D ## Example 1:
##D # cache is useful when objects used by FUN are not that big but calculations
##D # are time-comsuming. Take a look at this example:
##D fun <- function(n) {replicate(n, summary(lm(Sepal.Length~Species, iris))$r.squared)}
##D 
##D # let's check time of two evaluations of cache function
##D system.time( res <- cache(cacheRepo, fun, 1000) )
##D system.time( res <- cache(cacheRepo, fun, 1000) ) 
##D # The second call is much faster. Why is it so? Because the result of fun
##D # function evaluation has been stored in local cacheRepo during the first evaluation
##D # of cache. In the second call of cache we are simply loading the result of fun
##D # from local cacheRepo Repository.
##D 
##D ## Example 2:
##D testFun <- function(x) {cat(x);x}
##D 
##D # testFun will be executed and saved to cacheRepo
##D tmp <- cache(cacheRepo, testFun, "Say hallo!")
##D 
##D # testFun execution will be loaded from repository
##D tmp <- cache(cacheRepo, testFun, "Say hallo!")
##D 
##D # testFun will be executed once again as it fails with expiration date. It will
##D # be saved to cacheRepo.
##D tmp <- cache(cacheRepo, testFun, "Say hallo!", notOlderThan = now())
##D 
##D # testFun execution will be loaded from repository as it
##D # passes with expiration date [within hour]
##D tmp <- cache(cacheRepo, testFun, "Say hallo!", notOlderThan = now() - hours(1))
##D 
##D deleteLocalRepo( cacheRepo, TRUE)
##D rm( cacheRepo )
##D 
## End(Not run)




