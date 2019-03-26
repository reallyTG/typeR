library(EML)


### Name: eml_locate_schema
### Title: eml_locate_schema
### Aliases: eml_locate_schema

### ** Examples

## No test: 
f <- system.file("examples", "example-eml-2.1.1.xml", package = "EML")
eml <- xml2::read_xml(f)
schema <- eml_locate_schema(eml)
## End(No test)



