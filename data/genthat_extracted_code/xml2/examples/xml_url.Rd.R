library(xml2)


### Name: xml_url
### Title: The URL of an XML document
### Aliases: xml_url

### ** Examples

catalog <- read_xml(xml2_example("cd_catalog.xml"))
xml_url(catalog)

x <- read_xml("<foo/>")
xml_url(x)



