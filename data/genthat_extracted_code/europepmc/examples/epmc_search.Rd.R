library(europepmc)


### Name: epmc_search
### Title: Search Europe PMC publication database
### Aliases: epmc_search

### ** Examples

## Not run: 
##D #Search articles for 'Gabi-Kat'
##D my.data <- epmc_search(query='Gabi-Kat')
##D 
##D #Get article metadata by DOI
##D my.data <- epmc_search(query = 'DOI:10.1007/bf00197367')
##D 
##D #Get article metadata by PubMed ID (PMID)
##D my.data <- epmc_search(query = 'EXT_ID:22246381')
##D 
##D #Get only PLOS Genetics article with EMBL database references
##D my.data <- epmc_search(query = 'ISSN:1553-7404 HAS_EMBL:y')
##D #Limit search to 250 PLOS Genetics articles
##D my.data <- epmc_search(query = 'ISSN:1553-7404', limit = 250)
##D 
##D # exclude MeSH synonyms in search
##D my.data <- epmc_search(query = 'aspirin', synonym = FALSE)
##D 
##D # get 100 most cited atricles from PLOS ONE publsihed in 2014
##D epmc_search(query = '(ISSN:1932-6203) AND FIRST_PDATE:2014', sort = 'cited')
##D 
##D # print number of records found
##D attr(my.data, "hit_count")
##D 
##D # change output
##D 
## End(Not run)



