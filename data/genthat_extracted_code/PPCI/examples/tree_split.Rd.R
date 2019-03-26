library(PPCI)


### Name: tree_split
### Title: Split a Leaf in a Hierarchical Clustering Model
### Aliases: tree_split
### Keywords: file

### ** Examples

## load the optidigits dataset
data(optidigits)

## cluster using minimum normalised cut hyperplanes,
## assuming no domain knowledge begin with 8 clusters
sol <- ncutdc(optidigits$x, 8)

## visualise solution
plot(sol)

## node 13 shows evidence of multiple clusters. Inspect this node more closely
plot(sol, node = 13)

## split node 13
sol_new <- tree_split(sol, 13)

## compare the solutions using external cluster validity metrics
cluster_performance(sol$cluster, optidigits$c)

cluster_performance(sol_new$cluster, optidigits$c)



