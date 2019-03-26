library(xslt)


### Name: xslt
### Title: XSLT 1.0 Transformations
### Aliases: xslt xml_xslt xslt_version

### ** Examples

doc <- read_xml(system.file("examples/cd_catalog.xml", package = "xslt"))
style <- read_xml(system.file("examples/cd_catalog.xsl", package = "xslt"))
html <- xml_xslt(doc, style)
cat(as.character(html))



