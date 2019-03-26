library(RNeXML)


### Name: get_trees_list
### Title: extract all phylogenetic trees in ape format
### Aliases: get_trees_list

### ** Examples

comp_analysis <- system.file("examples", "comp_analysis.xml", package="RNeXML")
nex <- nexml_read(comp_analysis)
get_trees_list(nex)



