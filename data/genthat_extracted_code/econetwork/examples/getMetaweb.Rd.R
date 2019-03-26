library(econetwork)


### Name: getMetaweb
### Title: Get metaweb
### Aliases: getMetaweb

### ** Examples

# Generating a set of Erdos-Renyi graphs
library(igraph)
gList <- c()
for(i in 1:4){
  graphLocal <- erdos.renyi.game(60, type = 'gnp', p.or.m=0.1, directed=TRUE)
  V(graphLocal)$name <- as.character(1:60)
  gList <- c(gList, list(graphLocal))
}
names(gList) <- c("A","B","C","D")

## building the metaweb
graphMetaweb <- getMetaweb(gList)



