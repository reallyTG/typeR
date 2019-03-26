library(bootnet)


### Name: bootThreshold
### Title: Threshold network based on bootstrapped intervals
### Aliases: bootThreshold

### ** Examples

## Not run: 
##D # BFI Extraversion data from psych package:
##D library("psych")
##D data(bfi)
##D bfiSub <- bfi[,1:25]
##D 
##D # Estimate unregularized network:
##D Network <- estimateNetwork(bfiSub, default = "pcor", corMethod = "cor")
##D 
##D # Bootstrap 1000 values, using 8 cores:
##D boots <- bootnet(Network, nBoots = 1000, nCores = 8)
##D 
##D # Threshold network:
##D Network_thresholded <- bootThreshold(boots)
##D 
##D # Plot:
##D plot(Network_thresholded)
## End(Not run)



