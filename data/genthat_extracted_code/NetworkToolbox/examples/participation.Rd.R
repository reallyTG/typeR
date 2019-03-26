library(NetworkToolbox)


### Name: participation
### Title: Participation Coefficient
### Aliases: participation

### ** Examples

#theoretical factors
comm <- c(rep(1,8), rep(2,8), rep(3,8), rep(4,8), rep(5,8), rep(6,8))

A <- TMFG(neoOpen)$A

pc <- participation(A, comm = comm)

#walktrap factors
wpc <- participation(A, comm = "walktrap")




