library(cstab)


### Name: cStability
### Title: Selection of number of clusters via clustering instability
### Aliases: cStability

### ** Examples

## Not run: 
##D   # Generate Data from Gaussian Mixture
##D   s <- .1
##D   n <- 50
##D   data <- rbind(cbind(rnorm(n, 0, s), rnorm(n, 0, s)),
##D                 cbind(rnorm(n, 1, s), rnorm(n, 1, s)),
##D                 cbind(rnorm(n, 0, s), rnorm(n, 1, s)),
##D                 cbind(rnorm(n, 1, s), rnorm(n, 0, s)))
##D   plot(data)
##D 
##D   # Selection of Number of Clusters using Instability-based Measures
##D   stab_obj <- cStability(data, kseq=2:10)
##D   print(stab_obj)
##D   
## End(Not run)




