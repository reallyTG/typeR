library(xml2)


### Name: xml_path
### Title: Retrieve the xpath to a node
### Aliases: xml_path

### ** Examples

x <- read_xml("<foo><bar><baz /></bar><baz /></foo>")
xml_path(xml_find_all(x, ".//baz"))



