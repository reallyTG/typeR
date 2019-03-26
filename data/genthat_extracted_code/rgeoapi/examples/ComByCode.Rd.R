library(rgeoapi)


### Name: ComByCode
### Title: Get City by INSEE Code
### Aliases: ComByCode

### ** Examples

ComByCode(codeInsee = 29019) 
ComByCode(codeInsee = 31555, postal = TRUE)
ComByCode(codeInsee = ComByName("Rennes")[1,"codeInsee"])



