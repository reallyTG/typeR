library(bootnet)


### Name: bootInclude
### Title: Inclusion proportion graph
### Aliases: bootInclude

### ** Examples

## Not run: 
##D # BFI Extraversion data from psych package:
##D library("psych")
##D data(bfi)
##D # Subset of data:
##D bfiSub <- bfi[1:250,1:25]
##D 
##D # Estimate ggmModSelect networks (not stepwise to increase speed):
##D Network <- estimateNetwork(bfiSub], default = "ggmModSelect", corMethod = "cor",
##D               stepwise = FALSE)
##D 
##D # Bootstrap 100 values, using 8 cores (100 to incease speed, preferably 1000+):
##D boots <- bootnet(Network, nBoots = 100, nCores = 8)
##D 
##D # Threshold network:
##D Network_inclusion <- bootInclude(boots)
##D 
##D # Plot:
##D plot(Network_inclusion)
## End(Not run)



