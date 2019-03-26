library(distory)


### Name: dist.multiPhylo
### Title: Geodesic Distance Between Phylogenetic Trees
### Aliases: dist.multiPhylo

### ** Examples


data(woodmouse)
otree <- root(nj(dist.dna(woodmouse)), "No305", resolve.root=TRUE)
breps = 250

trees <- boot.phylo(otree, woodmouse, B=breps, function(x)
        root(nj(dist.dna(x)), "No305", resolve.root=TRUE),trees=TRUE)

combined.trees <- c(list(otree), trees$trees)
tree.dists <- dist.multiPhylo(combined.trees)

mdres <- cmdscale(tree.dists, k=breps, add=TRUE)
plot(mdres$points[,1], mdres$points[,2], col = c("red", rep("black", breps)))
text(mdres$points[,1], mdres$points[,2], ,labels=1:(breps+1), cex=0.7, adj=c(0,2))




