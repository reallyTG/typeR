library(EML)


### Name: get_unitList
### Title: get_unitList
### Aliases: get_unitList

### ** Examples


# Read in additional units defined in a EML file
## No test: 
f <- system.file("xsd/test/eml-datasetWithUnits.xml", package = "EML")
eml <- read_eml(f)
unitList <- get_unitList(eml@additionalMetadata[[1]]@metadata)

## Read in the definitions of standard units:
get_unitList()
## End(No test)




