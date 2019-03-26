library(NetworkToolbox)


### Name: core.items
### Title: Core Items
### Aliases: core.items

### ** Examples

#network
A <- TMFG(neoOpen)$A

#core items by network
coreBYnetwork <- core.items(A, by = "network")

#theoretical factors
comm <- c(rep(1,8),rep(2,8),rep(3,8),rep(4,8),rep(5,8),rep(6,8))

#core items by communities
coreBYcomm <- core.items(A, comm, by = "communities")




