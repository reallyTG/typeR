library(xml2)


### Name: xml_cdata
### Title: Construct a cdata node
### Aliases: xml_cdata

### ** Examples

x <- xml_new_root("root")
xml_add_child(x, xml_cdata("<d/>"))
as.character(x)



