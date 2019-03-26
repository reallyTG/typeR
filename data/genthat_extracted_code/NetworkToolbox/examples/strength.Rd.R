library(NetworkToolbox)


### Name: strength
### Title: Node Strength
### Aliases: strength

### ** Examples

#Undirected network
A <- TMFG(neoOpen)$A

str <- strength(A)

#Directed network
dep <- depend(neoOpen)

Adep <- TMFG(dep, depend = TRUE)$A

str <- strength(Adep)




