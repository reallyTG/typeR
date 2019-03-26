library(XML)


### Name: xmlSchemaValidate
### Title: Validate an XML document relative to an XML schema
### Aliases: xmlSchemaValidate schemaValidationErrorHandler
### Keywords: IO

### ** Examples

if(FALSE) {
  xsd = xmlParse(system.file("exampleData", "author.xsd", package = "XML"), isSchema =TRUE)
  doc = xmlInternalTreeParse(system.file("exampleData", "author.xml",  package = "XML"))
  xmlSchemaValidate(xsd, doc)
}



