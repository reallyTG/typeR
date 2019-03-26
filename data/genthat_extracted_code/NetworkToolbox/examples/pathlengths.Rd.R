library(NetworkToolbox)


### Name: pathlengths
### Title: Characteristic Path Lengths
### Aliases: pathlengths

### ** Examples

A<-TMFG(neoOpen)$A

#Unweighted
PL <- pathlengths(A)

#Weighted
PL <- pathlengths(A, weighted = TRUE)




