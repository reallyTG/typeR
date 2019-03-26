library(aVirtualTwins)


### Name: vt.tree
### Title: Trees to find Subgroups
### Aliases: vt.tree

### ** Examples

data(sepsis)
vt.o <- vt.data(sepsis, "survival", "THERAPY", T)
# inside model :
vt.f <- vt.forest("one", vt.o)
# use classification tree
vt.tr <- vt.tree("class", vt.f, threshold = c(0.01, 0.05))
# return a list
class(vt.tr)
# access one of the tree
tree1 <- vt.tr$tree1
# return infos
# vt.tr$tree1$getInfos()
# vt.tr$tree1$getRules()
# use vt.subgroups tool:
subgroups <- vt.subgroups(vt.tr)
  



