library(phateR)


### Name: phate
### Title: Run PHATE on an input data matrix
### Aliases: phate

### ** Examples

if (reticulate::py_module_available("phate")) {

# Load data
# data(tree.data)
# We use a smaller tree to make examples run faster
data(tree.data.small)

# Run PHATE
phate.tree <- phate(tree.data.small$data)
summary(phate.tree)
## PHATE embedding
## k = 5, alpha = 40, t = 58
## Data: (3000, 100)
## Embedding: (3000, 2)

library(graphics)
# Plot the result with base graphics
plot(phate.tree, col=tree.data.small$branches)
# Plot the result with ggplot2
if (require(ggplot2)) {
  ggplot(phate.tree) +
    geom_point(aes(x=PHATE1, y=PHATE2, color=tree.data.small$branches))
}

# Run PHATE again with different parameters
# We use the last run as initialization
phate.tree2 <- phate(tree.data.small$data, t=150, init=phate.tree)
# Extract the embedding matrix to use in downstream analysis
embedding <- as.matrix(phate.tree2)

}



