library(NetworkToolbox)


### Name: nams
### Title: Network Adjusted Mean/Sum
### Aliases: nams

### ** Examples

A <- TMFG(neoOpen)$A

#one community
sumadj <- nams(neoOpen, A, adjusted = "sum")

#theoretical communities
knowncomm <- nams(neoOpen, A,
comm = c(rep(1,8),rep(2,8),rep(3,8),rep(4,8),rep(5,8),rep(6,8)))

#walktrap communities
walkadj <- nams(neoOpen, A, adjusted = "sum", comm = "walktrap")




