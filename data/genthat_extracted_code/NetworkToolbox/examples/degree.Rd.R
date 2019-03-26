library(NetworkToolbox)


### Name: degree
### Title: Degree
### Aliases: degree

### ** Examples

#Undirected network
A <- TMFG(neoOpen)$A

deg <- degree(A)

#Directed network
dep <- depend(neoOpen)

Adep <- TMFG(dep, depend = TRUE)$A

deg <- degree(Adep)




