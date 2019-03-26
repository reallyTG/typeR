library(maptree)


### Name: group.tree
### Title: Observation Groups for Classification or Regression Tree
### Aliases: group.tree
### Keywords: manip tree

### ** Examples

  library (rpart)
  data (oregon.env.vars, oregon.grid)

  group <- group.tree (clip.rpart (rpart (oregon.env.vars), best=7))
  names(group) <- row.names(oregon.env.vars)
  map.groups (oregon.grid, group=group)



