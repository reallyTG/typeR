library(poppr)


### Name: diversity_ci
### Title: Perform bootstrap statistics, calculate, and plot confidence
###   intervals.
### Aliases: diversity_ci

### ** Examples

library(poppr)
data(Pinf)
diversity_ci(Pinf, n = 100L)
## Not run: 
##D # With pretty results
##D diversity_ci(Pinf, n = 100L, raw = FALSE)
##D 
##D # This can be done in a parallel fasion (OSX uses "multicore", Windows uses "snow")
##D system.time(diversity_ci(Pinf, 10000L, parallel = "multicore", ncpus = 4L))
##D system.time(diversity_ci(Pinf, 10000L))
##D 
##D # We often get many requests for a clonal fraction statistic. As this is 
##D # simply the number of observed MLGs over the number of samples, we 
##D # recommended that people calculate it themselves. With this function, you
##D # can add it in:
##D 
##D CF <- function(x){
##D  x <- drop(as.matrix(x))
##D  if (length(dim(x)) > 1){
##D    res <- rowSums(x > 0)/rowSums(x)
##D  } else {
##D    res <- sum(x > 0)/sum(x)
##D  }
##D  return(res)
##D }
##D # Show pretty results
##D 
##D diversity_ci(Pinf, 1000L, CF = CF, center = TRUE, raw = FALSE)
##D diversity_ci(Pinf, 1000L, CF = CF, rarefy = TRUE, raw = FALSE)
## End(Not run)




