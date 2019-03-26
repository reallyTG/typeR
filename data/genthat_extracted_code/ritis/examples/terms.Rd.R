library(ritis)


### Name: terms
### Title: Get ITIS terms, i.e., tsn's, authors, common names, and
###   scientific names.
### Aliases: terms

### ** Examples

## Not run: 
##D # Get terms searching both common and scientific names
##D terms(query='bear')
##D 
##D # Get terms searching just common names
##D terms(query='tarweed', "common")
##D 
##D # Get terms searching just scientific names
##D terms(query='Poa annua', "scientific")
##D 
##D # many at once
##D terms(query=c('Poa annua', 'Pinus contorta'), "scientific")
## End(Not run)



