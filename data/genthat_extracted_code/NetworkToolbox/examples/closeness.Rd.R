library(NetworkToolbox)


### Name: closeness
### Title: Closeness Centrality
### Aliases: closeness

### ** Examples

A <- TMFG(neoOpen)$A

#Weighted LC
LC <- closeness(A)

#Unweighted LC
LC <- closeness(A, weighted = FALSE)




