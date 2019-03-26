library(tree)


### Name: plot.tree.sequence
### Title: Plot a Tree Sequence
### Aliases: plot.tree.sequence
### Keywords: tree

### ** Examples

data(cpus, package="MASS")
cpus.ltr <- tree(log(perf) ~ syct + mmin + mmax + cach + chmin + chmax,
                 data = cpus)
plot(prune.tree(cpus.ltr))



