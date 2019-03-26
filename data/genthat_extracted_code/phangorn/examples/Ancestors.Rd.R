library(phangorn)


### Name: Ancestors
### Title: tree utility function
### Aliases: Ancestors allDescendants Children Descendants Siblings
###   mrca.phylo
### Keywords: internal misc

### ** Examples


tree <- rtree(10)
plot(tree, show.tip.label = FALSE)
nodelabels()
tiplabels()
Ancestors(tree, 1:3, "all")
Children(tree, 11)
Descendants(tree, 11, "tips")
Siblings(tree, 3)
# Siblings of all nodes
Siblings(tree)
mrca.phylo(tree, 1:3)
mrca.phylo(tree, match(c("t1", "t2", "t3"), tree$tip))
mrca.phylo(tree)
# same as mrca(tree), but faster for large trees




