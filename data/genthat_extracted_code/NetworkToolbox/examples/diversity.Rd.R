library(NetworkToolbox)


### Name: diversity
### Title: Diversity Coefficient
### Aliases: diversity

### ** Examples

A <- TMFG(neoOpen)$A

#theoretical communities
comm <- c(rep(1,8), rep(2,8), rep(3,8), rep(4,8), rep(5,8), rep(6,8))

gdiv <- diversity(A, comm = comm)

#walktrap communities
wdiv <- diversity(A, comm = "walktrap")




