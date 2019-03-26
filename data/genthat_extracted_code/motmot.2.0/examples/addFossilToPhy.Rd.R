library(motmot.2.0)


### Name: addFossilToPhy
### Title: add a fossil to an interior branch of a time-scaled phylogeny
### Aliases: addFossilToPhy

### ** Examples

data(anolis.tree)
plot(anolis.tree)
nodelabels(214, 214)
# add fossil to node 214
in.groups <- node.descendents(x=214, phy=anolis.tree, tip.labels=TRUE)[[2]]
fossilPhy <- addFossilToPhy(anolis.tree, in.groups, fossil="fakeFossil", fossilAge=60)
plot(fossilPhy)



