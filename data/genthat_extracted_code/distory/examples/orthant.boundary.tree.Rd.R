library(distory)


### Name: orthant.boundary.tree
### Title: Orthant Boundary Tree
### Aliases: orthant.boundary.tree

### ** Examples


data(woodmouse)
otree <- root(fastme.ols(dist.dna(woodmouse)), "No305", resolve.root=TRUE)
breps = 200

trees <- boot.phylo(otree, woodmouse, B=breps, function(x)
        root(fastme.ols(dist.dna(x)), "No305", resolve.root=TRUE),trees=TRUE)

combined.trees <- c(list(otree), trees$trees)

binning <- bin.multiPhylo(combined.trees)

tree.a <- combined.trees[[match(1, binning)]]
i = 2
max.bin = max(binning)
tree.b <- combined.trees[[match(2, binning)]]

while(length(distinct.edges(tree.a,tree.b)) > 1 && i < max.bin)
{
    i = i + 1
    tree.b = combined.trees[[match(i, binning)]]
}

plot(orthant.boundary.tree(tree.a, tree.b))




