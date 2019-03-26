library(EML)


### Name: get_attributes
### Title: get_attributes
### Aliases: get_attributes

### ** Examples

## No test: 
 # runs > 5s

eml <- read_eml(system.file("xsd/test/eml-datasetWithAttributelevelMethods.xml", package = "EML"))
get_attributes( eml@dataset@dataTable[[1]]@attributeList )

## End(No test)



