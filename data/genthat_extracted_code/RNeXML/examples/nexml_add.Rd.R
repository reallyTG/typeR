library(RNeXML)


### Name: nexml_add
### Title: add elements to a new or existing nexml object
### Aliases: nexml_add

### ** Examples

library("geiger")
data(geospiza)
geiger_nex <- nexml_add(geospiza$phy, type="trees")
geiger_nex <- nexml_add(geospiza$dat, nexml = geiger_nex, type="characters")



