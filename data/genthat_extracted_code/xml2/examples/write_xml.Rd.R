library(xml2)


### Name: write_xml
### Title: Write XML or HTML to disk.
### Aliases: write_xml write_xml.xml_document write_html
###   write_html.xml_document

### ** Examples

h <- read_html("<p>Hi!</p>")

tmp <- tempfile(fileext = ".xml")
write_xml(h, tmp, options = "format")
readLines(tmp)

# write formatted HTML output
write_html(h, tmp, options = "format")
readLines(tmp)



