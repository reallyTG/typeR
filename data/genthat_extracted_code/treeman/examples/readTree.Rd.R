library(treeman)


### Name: readTree
### Title: Read a Newick tree
### Aliases: readTree

### ** Examples

library(treeman)
# tree string with internal node labels as bootstrap results
tree <- readTree(text="((A:1.0,B:1.0)0.9:1.0,(C:1.0,D:1.0)0.8:1.0)0.7:1.0;",
spcl_slt_nm='bootstrap')
# retrieve bootstrap values by node
tree['bootstrap']



