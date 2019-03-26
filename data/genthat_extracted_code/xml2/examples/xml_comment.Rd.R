library(xml2)


### Name: xml_comment
### Title: Construct a comment node
### Aliases: xml_comment

### ** Examples

x <- xml_new_document()
r <- xml_add_child(x, "root")
xml_add_child(r, xml_comment("Hello!"))
as.character(x)



