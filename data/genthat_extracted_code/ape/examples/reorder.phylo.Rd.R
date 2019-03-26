library(ape)


### Name: reorder.phylo
### Title: Internal Reordering of Trees
### Aliases: reorder.phylo reorder.multiPhylo cladewise postorder
### Keywords: manip

### ** Examples

data(bird.families)
tr <- reorder(bird.families, "postorder")
all.equal(bird.families, tr) # uses all.equal.phylo actually
all.equal.list(bird.families, tr) # bypasses the generic

## get the number of descendants for each tip or node:
nr_desc <-  function(x) {
    res <- numeric(max(x$edge))
    res[1:Ntip(x)] <- 1L
    for (i in postorder(x)) {
       tmp <- x$edge[i,1]
       res[tmp] <- res[tmp] + res[x$edge[i, 2]]
   }
   res
}
## apply it to a random tree:
tree <- rtree(10)
plot(tree, show.tip.label = FALSE)
tiplabels()
nodelabels()
nr_desc(tree)



