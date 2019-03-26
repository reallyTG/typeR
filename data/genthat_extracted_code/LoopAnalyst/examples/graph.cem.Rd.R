library(LoopAnalyst)


### Name: graph.cem
### Title: Graph a Community Effect Matrix
### Aliases: graph.cem
### Keywords: file

### ** Examples

## graph a community effect matrix
data(cm.levins)
make.cem(cm.levins) -> cem.levins
graph.cem(cem.levins, file="levins.dot", color="color")

## graph a community effect matrix
data(cm.dambacher)
make.cem(cm.dambacher) -> cem.dambacher
graph.cem(cem.dambacher, file="dambacher.dot", color="color")



