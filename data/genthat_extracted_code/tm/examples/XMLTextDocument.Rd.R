library(tm)


### Name: XMLTextDocument
### Title: XML Text Documents
### Aliases: XMLTextDocument

### ** Examples

xml <- system.file("extdata", "order-doc.xml", package = "xml2")
(xtd <- XMLTextDocument(xml2::read_xml(xml),
                        heading = "XML text document",
                        id = xml,
                        language = "en"))
content(xtd)
meta(xtd)



