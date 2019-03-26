library(emld)


### Name: as_xml
### Title: Coerce an emld object into XML (EML's standard format)
### Aliases: as_xml

### ** Examples

f <- system.file("extdata/example.xml", package = "emld")
emld <- as_emld(f)
xml <- as_xml(emld)

## can also write directly to a file:
xml_file <- tempfile()
as_xml(emld, xml_file)



