library(PIGShift)


### Name: remove.from.genome
### Title: Remove genes from a specified group from the data
### Aliases: remove.from.genome

### ** Examples

data(yeast)
GO.groups.pruned = good.groups(colnames(yeast.hybrid),GO.groups,10)
dim(yeast.hybrid)
to_remove = setdiff(names(GO.groups),GO.groups.pruned)
yeast.hybrid.pruned = remove.from.genome(yeast.hybrid,GO.groups,to_remove)
dim(yeast.hybrid.pruned)



