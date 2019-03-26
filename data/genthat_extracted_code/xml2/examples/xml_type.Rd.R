library(xml2)


### Name: xml_type
### Title: Determine the type of a node.
### Aliases: xml_type

### ** Examples

x <- read_xml("<foo> a <b /> <![CDATA[ blah]]></foo>")
xml_type(x)
xml_type(xml_contents(x))



