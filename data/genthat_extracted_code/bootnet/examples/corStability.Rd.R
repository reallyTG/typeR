library(bootnet)


### Name: corStability
### Title: Correlation stability coefficient
### Aliases: corStability

### ** Examples

## Not run: 
##D # BFI Extraversion data from psych package:
##D library("psych")
##D data(bfi)
##D bfiSub <- bfi[,1:25]
##D 
##D # Estimate network:
##D Network <- estimateNetwork(bfiSub, default = "EBICglasso")
##D 
##D # Bootstrap 1000 values, using 8 cores:
##D # Bootstrap 1000 values, using 8 cores:
##D Results2 <- bootnet(Network, nBoots = 1000, nCores = 8, 
##D               type = "case")
##D 
##D # Compute CS-coefficients:
##D corStability(Results2)
## End(Not run)



