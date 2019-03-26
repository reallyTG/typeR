library(EML)


### Name: eml_validate
### Title: eml_validate
### Aliases: eml_validate

### ** Examples

## No test: 

 f <- system.file("xsd/test", "eml.xml", package = "EML")

 ## validate given a file name, without needing to parse first
 eml_validate(f)

## Validate given an "eml" object
eml <- read_eml(f)
eml_validate(eml)

## End(No test)




