library(taxize)


### Name: gni_parse
### Title: Parse scientific names using EOL's name parser.
### Aliases: gni_parse

### ** Examples

## Not run: 
##D gni_parse("Cyanistes caeruleus")
##D gni_parse("Plantago minor")
##D gni_parse("Plantago minor minor")
##D gni_parse(c("Plantago minor minor","Helianthus annuus texanus"))
##D 
##D # pass on curl options to httr
##D library("httr")
##D gni_parse("Cyanistes caeruleus", config = verbose())
## End(Not run)



