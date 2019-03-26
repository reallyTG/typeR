library(RNeXML)


### Name: get_flat_trees
### Title: get_flat_trees
### Aliases: get_flat_trees

### ** Examples

comp_analysis <- system.file("examples", "comp_analysis.xml", package="RNeXML")
nex <- nexml_read(comp_analysis)
get_flat_trees(nex)



