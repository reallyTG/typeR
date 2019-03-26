library(bootnet)


### Name: bootnet
### Title: Bootstrapped network estimation
### Aliases: bootnet

### ** Examples

# BFI Extraversion data from psych package:
library("psych")
data(bfi)
bfiSub <- bfi[,1:25]

# Estimate network:
Network <- estimateNetwork(bfiSub, default = "EBICglasso")

# Centrality indices:
library("qgraph")
centralityPlot(Network)

## Not run: 
##D # Estimated network:
##D plot(Network, layout = 'spring') 
##D 
##D ### Non-parametric bootstrap ###
##D # Bootstrap 1000 values, using 8 cores:
##D Results1 <- bootnet(Network, nBoots = 1000, nCores = 8)
##D 
##D # Plot bootstrapped edge CIs:
##D plot(Results1, labels = FALSE, order = "sample")
##D 
##D # Plot significant differences (alpha = 0.05) of edges:
##D plot(Results1, "edge", plot = "difference",onlyNonZero = TRUE,
##D      order = "sample") 
##D 
##D # Plot significant differences (alpha = 0.05) of node strength:
##D plot(Results1, "strength", plot = "difference")
##D 
##D # Test for difference in strength between node "A1" and "C2":
##D differenceTest(Results,  "A1", "C2", "strength")
##D 
##D ### Case-drop bootstrap ###
##D # Bootstrap 1000 values, using 8 cores:
##D Results2 <- bootnet(Network, nBoots = 1000, nCores = 8, 
##D               type = "case")
##D 
##D # Plot centrality stability:
##D plot(Results2)
##D 
##D # Compute CS-coefficients:
##D corStability(Results2)
## End(Not run)



