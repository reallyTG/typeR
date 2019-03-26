library(maptree)


### Name: draw.tree
### Title: Graph a Classification or Regression Tree
### Aliases: draw.tree
### Keywords: hplot tree

### ** Examples

  library (rpart)
  data (oregon.env.vars)

  draw.tree (clip.rpart (rpart (oregon.env.vars), best=7), 
      nodeinfo=TRUE, units="species", cases="cells", digits=0)



