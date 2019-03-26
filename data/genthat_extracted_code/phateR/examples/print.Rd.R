library(phateR)


### Name: print.phate
### Title: Print a PHATE object
### Aliases: print.phate

### ** Examples

if (reticulate::py_module_available("phate")) {

# data(tree.data)
# We use a smaller tree to make examples run faster
data(tree.data.small)
phate.tree <- phate(tree.data.small$data)
print(phate.tree)
## PHATE embedding with elements
## $embedding : (3000, 2)
## $operator : Python PHATE operator
## $params : list with elements (data, k, alpha, t, n.landmark, ndim,
##                               gamma, npca, mds.method,
##                               knn.dist.method, mds.dist.method)

}



