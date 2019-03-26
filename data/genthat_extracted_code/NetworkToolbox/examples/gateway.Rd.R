library(NetworkToolbox)


### Name: gateway
### Title: Gateway Coefficient
### Aliases: gateway

### ** Examples

#theoretical communities
comm <- c(rep(1,8), rep(2,8), rep(3,8), rep(4,8), rep(5,8), rep(6,8))

A <- TMFG(neoOpen)$A

gw <- gateway(A, comm = comm)

#walktrap communities
wgw <- gateway(A, comm = "walktrap")




