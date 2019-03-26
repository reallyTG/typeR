library(liayson)


### Name: clusterCells
### Title: Grouping cells into clones.
### Aliases: clusterCells

### ** Examples

data(cnps)
set.seed(2)
rcells = sample(colnames(cnps), 120)
outc = clusterCells(cnps[apply(cnps, 1, var)>0, rcells])



