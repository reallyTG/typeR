library(bootnet)


### Name: estimateNetwork
### Title: Estimate a network structure
### Aliases: estimateNetwork bootnet_EBICglasso bootnet_pcor bootnet_cor
###   bootnet_IsingFit bootnet_IsingSampler bootnet_adalasso bootnet_huge
###   bootnet_mgm bootnet_relimp bootnet_TMFG bootnet_LoGo
###   bootnet_ggmModSelect bootnet_graphicalVAR

### ** Examples

# BFI Extraversion data from psych package:
library("psych")
data(bfi)
bfiSub <- bfi[,1:25]

# Estimate network:
Network <- estimateNetwork(bfiSub, default = "EBICglasso")

## Not run: 
##D # Some pointers:
##D print(Network)
##D 
##D # Estimated network:
##D plot(Network, layout = 'spring') 
##D 
##D # Centrality indices:
##D library("qgraph")
##D centralityPlot(Network)
##D 
##D # BIC model selection:
##D Network_BIC <- estimateNetwork(bfiSub, default = "EBICglasso", tuning = 0)
##D 
##D # Ising model:
##D Network_BIC <- estimateNetwork(bfiSub, default = "IsingFit")
## End(Not run)



