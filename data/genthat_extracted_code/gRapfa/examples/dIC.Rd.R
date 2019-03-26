library(gRapfa)


### Name: dIC
### Title: Difference in information criteria
### Aliases: dIC

### ** Examples

library(gRapfa)
data(Wheeze)
G <- st(Wheeze)
G.c <- contract.last.level(G)
dic1 <- dIC(G.c, nodeset=c(5,3))
dic2 <- dIC(G.c, nodeset=c(6,4))



