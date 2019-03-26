library(paleotree)


### Name: perfectParsCharTree
### Title: Simulate a Set of Parsimony-Informative Characters for a
###   Phylogeny
### Aliases: perfectParsCharTree

### ** Examples

data(retiolitinae)

#fewer characters than nodes
perfectParsCharTree(retioTree,nchar = 10)

#same as number of nodes (minus root)
perfectParsCharTree(retioTree,nchar = 12)

#more characters than the number of nodes
perfectParsCharTree(retioTree,nchar = 20)



