library(taxize)


### Name: tax_name
### Title: Get taxonomic names for a given rank
### Aliases: tax_name

### ** Examples

## Not run: 
##D # A case where itis and ncbi use the same names
##D tax_name(query = "Helianthus annuus", get = "family", db = "itis")
##D tax_name(query = "Helianthus annuus", get = "family", db = "ncbi")
##D tax_name(query = "Helianthus annuus", get = c("genus","family","order"),
##D   db = "ncbi")
##D 
##D # Case where itis and ncbi use different names
##D tax_name(query = "Helianthus annuus", get = "kingdom", db = "itis")
##D tax_name(query = "Helianthus annuus", get = "kingdom", db = "ncbi")
##D 
##D # multiple rank arguments
##D tax_name(query = c("Helianthus annuus","Baetis rhodani"), get = c("genus",
##D "kingdom"), db = "ncbi")
##D tax_name(query = c("Helianthus annuus","Baetis rhodani"), get = c("genus",
##D "kingdom"), db = "itis")
##D 
##D # query both sources
##D tax_name(query=c("Helianthus annuus", 'Baetis rhodani'), get=c("genus",
##D "kingdom"), db="both")
## End(Not run)



