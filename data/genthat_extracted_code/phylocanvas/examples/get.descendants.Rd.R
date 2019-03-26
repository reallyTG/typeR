library(phylocanvas)


### Name: get.descendants
### Title: get descendants
### Aliases: get.descendants

### ** Examples

birdfile <- system.file("treedata/birdfamilies.tree", package="phylocanvas")
tree <- load.tree(birdfile)
node <- phylobase::MRCA(tree, c("Cerylidae", "Upupidae"))
get.descendants(tree, node)




