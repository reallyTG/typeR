library(emld)


### Name: eml_validate
### Title: eml_validate
### Aliases: eml_validate

### ** Examples

## No test: 

 f <- system.file("extdata", "example.xml", package = "emld")

 ## validate file directly from disk:
 eml_validate(f)

 ## validate an eml object:
 eml <- as_emld(f)
 eml_validate(eml)

## End(No test)




