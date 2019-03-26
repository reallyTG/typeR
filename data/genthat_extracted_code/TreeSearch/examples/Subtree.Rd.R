library(TreeSearch)


### Name: Subtree
### Title: Extract subtree
### Aliases: Subtree

### ** Examples

{
tree <- Preorder(ape::rtree(20, br=NULL))
plot(tree); ape::nodelabels(); ape::nodelabels(33, 33, bg='yellow'); dev.new()
plot(Subtree(tree, 33))
}




