library(xml2)


### Name: xml_serialize
### Title: Serializing XML objects to connections.
### Aliases: xml_serialize xml_unserialize

### ** Examples

library(xml2)
x <- read_xml("<a>
  <b><c>123</c></b>
  <b><c>456</c></b>
</a>")

b <- xml_find_all(x, "//b")
out <- xml_serialize(b, NULL)
xml_unserialize(out)



