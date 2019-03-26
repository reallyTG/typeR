library(phateR)


### Name: ggplot.phate
### Title: Convert a PHATE object to a data.frame for ggplot
### Aliases: ggplot.phate

### ** Examples

if (reticulate::py_module_available("phate") && require(ggplot2)) {

# data(tree.data)
# We use a smaller tree to make examples run faster
data(tree.data.small)
phate.tree <- phate(tree.data.small$data)
ggplot(phate.tree, aes(x=PHATE1, y=PHATE2, color=tree.data.small$branches)) +
  geom_point()

}



