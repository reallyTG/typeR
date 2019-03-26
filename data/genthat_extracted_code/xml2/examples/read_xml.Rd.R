library(xml2)


### Name: read_xml
### Title: Read HTML or XML.
### Aliases: read_xml read_html read_xml.character read_xml.raw
###   read_xml.connection

### ** Examples

# Literal xml/html is useful for small examples
read_xml("<foo><bar /></foo>")
read_html("<html><title>Hi<title></html>")
read_html("<html><title>Hi")

# From a local path
read_html(system.file("extdata", "r-project.html", package = "xml2"))

# From a url
cd <- read_xml(xml2_example("cd_catalog.xml"))
me <- read_html("http://had.co.nz")



