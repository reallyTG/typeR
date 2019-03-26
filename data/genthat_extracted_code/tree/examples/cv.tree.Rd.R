library(tree)


### Name: cv.tree
### Title: Cross-validation for Choosing Tree Complexity
### Aliases: cv.tree
### Keywords: tree

### ** Examples

data(cpus, package="MASS")
cpus.ltr <- tree(log10(perf) ~ syct + mmin + mmax + cach
     + chmin + chmax, data=cpus)
cv.tree(cpus.ltr, , prune.tree)



