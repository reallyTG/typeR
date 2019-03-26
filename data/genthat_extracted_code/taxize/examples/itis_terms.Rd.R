library(taxize)


### Name: itis_terms
### Title: Get ITIS terms, i.e., tsn's, authors, common names, and
###   scientific names.
### Aliases: itis_terms

### ** Examples

## Not run: 
##D # Get terms searching both common and scientific names
##D itis_terms(query='bear')
##D 
##D # Get terms searching just common names
##D itis_terms(query='tarweed', "common")
##D 
##D # Get terms searching just scientific names
##D itis_terms(query='Poa annua', "scientific")
## End(Not run)



