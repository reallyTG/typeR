library(RNeXML)


### Name: get_taxa
### Title: get_taxa
### Aliases: get_taxa get_otu

### ** Examples

comp_analysis <- system.file("examples", "comp_analysis.xml", package="RNeXML")
nex <- nexml_read(comp_analysis)
get_taxa(nex)



