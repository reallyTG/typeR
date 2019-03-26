library(igraph)


### Name: membership
### Title: Functions to deal with the result of network community detection
### Aliases: membership communities algorithm crossing cutat merges sizes
###   cut_at is.hierarchical print.communities plot.communities
###   length.communities as.dendrogram.communities as.hclust.communities
###   code_len asPhylo asPhylo.communities showtrace code.length as_phylo
###   as_phylo.communities show_trace is_hierarchical print.communities
###   modularity.communities length.communities sizes algorithm merges
###   crossing code_len is_hierarchical as.dendrogram.communities
###   as.hclust.communities as_phylo as_phylo.communities cut_at show_trace
###   plot.communities
### Keywords: graphs

### ** Examples


karate <- make_graph("Zachary")
wc <- cluster_walktrap(karate)
modularity(wc)
membership(wc)
plot(wc, karate)




