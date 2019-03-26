library(EML)


### Name: eml_get
### Title: eml_get
### Aliases: eml_get eml_get,attributeList-method eml_get,unitList-method

### ** Examples

## No test: 
f <- system.file("xsd/test", "eml-datasetWithUnits.xml", package = "EML")
eml <- read_eml(f)
eml_get(eml, "physical")
eml_get(eml, "attributeList")

## The first argument need not be an "eml" class, it could be a child element; e.g.
eml_get(eml@dataset@dataTable, "physical")
## End(No test)



