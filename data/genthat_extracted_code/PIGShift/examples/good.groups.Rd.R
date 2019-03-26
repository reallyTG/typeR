library(PIGShift)


### Name: good.groups
### Title: Find groups represented in the data
### Aliases: good.groups

### ** Examples

data(yeast)
length(GO.groups)
GO.groups.pruned = good.groups(colnames(yeast.hybrid),GO.groups,10)
length(GO.groups.pruned)



