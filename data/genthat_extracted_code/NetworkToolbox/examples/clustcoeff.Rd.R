library(NetworkToolbox)


### Name: clustcoeff
### Title: Clustering Coefficient
### Aliases: clustcoeff

### ** Examples

A <- TMFG(neoOpen)$A

#Unweighted CC
CCu <- clustcoeff(A)

#Weighted CC
CCw <- clustcoeff(A, weighted=TRUE)




