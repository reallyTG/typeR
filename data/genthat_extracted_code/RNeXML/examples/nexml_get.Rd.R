library(RNeXML)


### Name: nexml_get
### Title: Get the desired element from the nexml object
### Aliases: nexml_get get_item

### ** Examples

comp_analysis <- system.file("examples", "comp_analysis.xml", package="RNeXML")
nex <- nexml_read(comp_analysis)
nexml_get(nex, "trees")
nexml_get(nex, "characters_list")



