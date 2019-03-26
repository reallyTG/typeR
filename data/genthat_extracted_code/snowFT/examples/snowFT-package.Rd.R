library(snowFT)


### Name: snowFT-package
### Title: Fault Tolerant Simple Network of Workstations
### Aliases: snowFT-package snowFT
### Keywords: programming package

### ** Examples

## Not run: 
##D # generates 500 times 1000 normally distributed random numbers on 5 nodes
##D # (all localhost)
##D res <- performParallel(5, rep(1000, 500), fun = rnorm, cltype = "SOCK")
##D print(mean(unlist(res)))
##D 
##D # View cluster usage
##D # number of physical nodes
##D P <- parallel::detectCores(logical = FALSE)
##D t <- snow::snow.time(performParallel(P, rep(1e6, 50), 
##D         fun = function(x) median(rnorm(x)), cltype = "SOCK"))
##D plot(t)
## End(Not run)




