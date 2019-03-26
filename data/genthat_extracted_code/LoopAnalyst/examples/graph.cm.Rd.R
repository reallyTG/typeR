library(LoopAnalyst)


### Name: graph.cm
### Title: Graph a Community Matrix
### Aliases: graph.cm
### Keywords: file

### ** Examples

## graph a community matrix
data(cm.levins)
graph.cm(cm.levins, file="levins.dot")

## graph a community matrix
data(cm.dambacher)
graph.cm(cm.dambacher, file="dambacher.dot", color="color")



