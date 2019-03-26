library(RNeXML)


### Name: get_characters_list
### Title: Extract the character matrix
### Aliases: get_characters_list

### ** Examples

comp_analysis <- system.file("examples", "comp_analysis.xml", package="RNeXML")
nex <- nexml_read(comp_analysis)
get_characters_list(nex)



