library(NetworkToolbox)


### Name: comcat
### Title: Communicating Nodes
### Aliases: comcat

### ** Examples

A <- TMFG(neoOpen)$A

communicating <- comcat(A, comm = "walktrap", cent = "strength", metric = "across")




