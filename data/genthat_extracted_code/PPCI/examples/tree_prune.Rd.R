library(PPCI)


### Name: tree_prune
### Title: Prune a Hierarchical Clustering Model
### Aliases: tree_prune
### Keywords: file

### ** Examples

## load the optidigits dataset
data(optidigits)

## cluster using minimum normalised cut hyperplanes,
## assuming no domain knowledge begin with 12 clusters
sol <- ncutdc(optidigits$x, 12)

## the node numbered 11 has been split,
## yet it appears there may not be multiple clusters present.
## inspect this node more closely
plot(sol, node = 11)

## remove this node from the model
sol_new <- tree_prune(sol, 11)

## compare the solutions using external cluster validity metrics

cluster_performance(sol$cluster, optidigits$c)

cluster_performance(sol_new$cluster, optidigits$c)



