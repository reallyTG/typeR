library(adegenet)


### Name: snapclust.choose.k
### Title: Choose the number of clusters for snapclust
### Aliases: snapclust.choose.k

### ** Examples

## Not run: 
##D  ## 'a' is a simulated dataset with 6 populations, island model
##D  data(dapcIllus)
##D  a <- dapcIllus$a
##D  a
##D 
##D  ## try and choose 'k' using AIC (real value = 6)
##D  a.aic <- snapclust.choose.k(max = 10, a)
##D  plot(1:10, a.aic, xlab = "Number of clusters (k)",
##D       ylab = "AIC", type = "b", pch = 20, cex = 3)
##D 
##D  ## try and choose 'k' using AIC (real value = 6)
##D  a.kic <- snapclust.choose.k(max = 10, a, IC = KIC)
##D  plot(1:10, a.kic, xlab = "Number of clusters (k)",
##D       ylab = "KIC", type = "b", pch = 20, cex = 3)
##D 
##D 
## End(Not run)



