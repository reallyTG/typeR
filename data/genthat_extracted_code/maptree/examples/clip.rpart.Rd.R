library(maptree)


### Name: clip.rpart
### Title: Prunes an Rpart Classification or Regression Tree
### Aliases: clip.rpart
### Keywords: manip cluster

### ** Examples

  library (rpart)
  data (oregon.env.vars, oregon.border, oregon.grid)

  draw.tree (clip.rpart (rpart (oregon.env.vars), best=7), 
    nodeinfo=TRUE, units="species", cases="cells", digits=0)

  group <- group.tree (clip.rpart (rpart (oregon.env.vars), best=7))
  names(group) <- row.names(oregon.env.vars)
  map.groups (oregon.grid, group)
  lines (oregon.border)
  map.key (0.05, 0.65, labels=as.character(seq(6)), 
    size=1, new=FALSE, sep=0.5, pch=19, head="node")



