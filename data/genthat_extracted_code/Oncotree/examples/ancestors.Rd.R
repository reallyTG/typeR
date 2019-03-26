library(Oncotree)


### Name: ancestors
### Title: Find ancestors within an oncogenetic tree.
### Aliases: ancestors least.common.ancestor
### Keywords: models

### ** Examples

  data(ov.cgh)
  ov.tree <- oncotree.fit(ov.cgh)
  ancestors(ov.tree, "4q-")
  ancestors(ov.tree, "Xp-")
  least.common.ancestor(ov.tree, "4q-","Xp-")  #"5q-"



