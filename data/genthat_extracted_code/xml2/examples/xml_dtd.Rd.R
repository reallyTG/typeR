library(xml2)


### Name: xml_dtd
### Title: Construct a document type definition
### Aliases: xml_dtd

### ** Examples

r <- xml_new_root(
  xml_dtd("html",
    "-//W3C//DTD XHTML 1.0 Transitional//EN",
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"))

# Use read_xml directly for more complicated DTD
d <- read_xml(
'<!DOCTYPE doc [
<!ELEMENT doc (#PCDATA)>
<!ENTITY foo " test ">
]>
<doc>This is a valid document &foo; !</doc>')



