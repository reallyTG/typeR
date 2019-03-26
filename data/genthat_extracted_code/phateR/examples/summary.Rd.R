library(phateR)


### Name: summary.phate
### Title: Summarize a PHATE object
### Aliases: summary.phate

### ** Examples

if (reticulate::py_module_available("phate")) {

# data(tree.data)
# We use a smaller tree to make examples run faster
data(tree.data.small)
phate.tree <- phate(tree.data.small$data)
summary(phate.tree)
## PHATE embedding
## k = 5, alpha = 40, t = 58
## Data: (3000, 100)
## Embedding: (3000, 2)

}



