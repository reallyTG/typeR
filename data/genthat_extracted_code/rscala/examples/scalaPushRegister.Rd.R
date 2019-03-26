library(rscala)


### Name: scalaPushRegister
### Title: Register Functions to Push and Pull Between R and Scala
### Aliases: scalaPushRegister scalaPullRegister

### ** Examples

## No test: 
s <- scala()

name <- "Grace"
nameAsRObject <- scalaPush(name,"generic")   # Basic serialization
scalaType(nameAsRObject)
identical(name,scalaPull(nameAsRObject,"generic"))

scalaPush.character <- function(x, bridge) {
  if ( is.character(x) && ( length(x) == 1L ) ) bridge(x=x) ^ 'x'
  else stop("'x' should be a character vector.")
}
scalaPushRegister(scalaPush.character, "character")
nameAsString <- scalaPush(name, "character", s)    # More specific serialization
scalaType(nameAsString)

scalaPull.character <- function(reference, bridge) {
  if ( scalaType(reference) == "String" ) reference$toString()
  else stop("'reference' should be a 'String'.")
}
scalaPullRegister(scalaPull.character, "character")
identical(name,scalaPull(nameAsString,"character"))

close(s)
## End(No test)




