library(fulltext)


### Name: eupmc
### Title: Europe PMC utilities
### Aliases: eupmc eupmc_search eupmc_fields eupmc_xml
### Keywords: internal

### ** Examples

## Not run: 
##D # search
##D eupmc_search(query = 'ecology')
##D eupmc_search(query = 'human malaria')
##D eupmc_search(query = '"human malaria"')
##D eupmc_search(query = 'auth:stoehr')
##D eupmc_search(query = 'journal:pnas')
##D eupmc_search(query = 'journal:pnas')
##D eupmc_search(query = 'ext_id:781840 src:med')
##D eupmc_search(query = 'ext_id:IND43783977 src:agr')
##D 
##D # list indexed search fields
##D x <- eupmc_fields()
##D NROW(x)
##D head(x)
##D 
##D # get full text XML
##D eupmc_xml('PMC3257301')
## End(Not run)



