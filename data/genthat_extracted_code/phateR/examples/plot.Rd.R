library(phateR)


### Name: plot.phate
### Title: Plot a PHATE object in base R
### Aliases: plot.phate

### ** Examples

if (reticulate::py_module_available("phate")) {

library(graphics)
# data(tree.data)
# We use a smaller tree to make examples run faster
data(tree.data.small)
phate.tree <- phate(tree.data.small$data)
plot(phate.tree, col=tree.data.small$branches)

}



