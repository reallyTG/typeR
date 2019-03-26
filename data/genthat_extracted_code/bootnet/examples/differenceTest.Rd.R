library(bootnet)


### Name: differenceTest
### Title: Bootstrapped difference test
### Aliases: differenceTest

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
##D Results1 <- bootnet(Network, nBoots = 1000, nCores = 8)
##D 
##D # Test for difference in strength between node "A1" and "C2":
##D differenceTest(Results,  "A1", "C2", "strength")
##D 
##D # Test for difference between edge N1--N2 and N3--N4:
##D differenceTest(Results,  "N1--N2", "N3--N4", "edge")
##D 
##D # Alternative:
##D differenceTest(Results,  x = "N1", x2 = "N2", y = "N3", 
##D                 y2 = "N4", measure = "edge")
## End(Not run)



