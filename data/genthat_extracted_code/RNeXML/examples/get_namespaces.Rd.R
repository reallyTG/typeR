library(RNeXML)


### Name: get_namespaces
### Title: get namespaces
### Aliases: get_namespaces

### ** Examples

comp_analysis <- system.file("examples", "comp_analysis.xml", package="RNeXML")
nex <- nexml_read(comp_analysis)
get_namespaces(nex)



