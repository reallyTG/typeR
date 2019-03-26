library(RNeXML)


### Name: get_trees
### Title: extract a phylogenetic tree from the nexml
### Aliases: get_trees

### ** Examples

comp_analysis <- system.file("examples", "comp_analysis.xml", package="RNeXML")
nex <- nexml_read(comp_analysis)
get_trees(nex)



