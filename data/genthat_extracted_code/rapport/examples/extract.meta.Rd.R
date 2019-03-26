library(rapport)


### Name: extract.meta
### Title: Extract Template Metadata
### Aliases: extract.meta

### ** Examples

## Not run: 
##D     rapport:::extract.meta("Name: John Smith", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
##D     ## $name
##D     ## [1] "John Smith"
##D 
##D     rapport:::extract.meta("Name: John", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
##D     ## $name
##D     ## [1] "John"
## End(Not run)



