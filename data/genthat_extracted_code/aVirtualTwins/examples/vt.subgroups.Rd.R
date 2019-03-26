library(aVirtualTwins)


### Name: vt.subgroups
### Title: Visualize subgroups
### Aliases: vt.subgroups

### ** Examples

data(sepsis)
vt.o <- vt.data(sepsis, "survival", "THERAPY", TRUE)
# inside model :
vt.f <- vt.forest("one", vt.o)
# use classification tree
vt.tr <- vt.tree("class", vt.f, threshold = c(0.01, 0.05))
# show subgroups
subgroups <- vt.subgroups(vt.tr)
# change options you'll be surprised !
subgroups <- vt.subgroups(vt.tr, verbose = TRUE, tables = TRUE)




