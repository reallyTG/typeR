library(NetworkToolbox)


### Name: leverage
### Title: Leverage Centrality
### Aliases: leverage

### ** Examples

A <- TMFG(neoOpen)$A

#Weighted
levW <- leverage(A)

#Unweighted
levU <- leverage(A, weighted = FALSE)




