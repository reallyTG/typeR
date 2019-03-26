library(snowFT)


### Name: snowFT-cluster
### Title: Cluster-Level Functions
### Aliases: performParallel clusterApplyFT clusterCallpart
###   clusterEvalQpart printClusterInfo
### Keywords: programming

### ** Examples

## Not run: 
##D # generates n normally distributed random numbers in r replicates
##D # on p nodes and prints their mean after each r/10 replicate.
##D 
##D printfun <- function(res, n, args = NULL) {
##D   res <- unlist(res)
##D   res <- res[!is.null(res)]
##D   print(paste("mean after:", n, "replicates:", mean(res),
##D            "(from", length(res), "RNs)"))
##D   }
##D 
##D r <- 1000; n <- 100; p <- 5
##D res <- performParallel(p, rep(n,r), fun = rnorm, seed = 1, 
##D                 printfun = printfun)
##D 
##D # Setting p <- 0 will run the rnorm call above sequentially and  
##D # should give exactly the same results
##D res.seq <- performParallel(0, rep(n,r), fun = rnorm, seed = 1, 
##D                 printfun = printfun)
##D identical(res, res.seq)
##D 
##D # Example with worker initialization
##D mean <- 20
##D sd <- 10
##D myfun <- function(r) rdnorm(r, mean = mean, sd = sd)
##D 
##D res <- unlist(performParallel(p, rep(1000, 100), fun = myfun, seed = 123,
##D          initexpr = library(extraDistr), export = c("mean", "sd")))
##D hist(res)
##D 
##D # See example in ?snowFT for plotting cluster usage.
## End(Not run)




