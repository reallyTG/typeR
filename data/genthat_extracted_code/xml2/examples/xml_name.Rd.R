library(xml2)


### Name: xml_name
### Title: The (tag) name of an xml element.
### Aliases: xml_name xml_name<- xml_set_name

### ** Examples

x <- read_xml("<bar>123</bar>")
xml_name(x)

y <- read_xml("<bar><baz>1</baz>abc<foo /></bar>")
z <- xml_children(y)
xml_name(xml_children(y))



