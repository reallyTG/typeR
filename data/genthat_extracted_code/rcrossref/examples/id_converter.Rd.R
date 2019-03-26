library(rcrossref)


### Name: id_converter
### Title: Get a PMID from a DOI, and vice versa.
### Aliases: id_converter

### ** Examples

## Not run: 
##D # get a pmid/pmcid from a doi
##D id_converter("10.1038/ng.590")
##D 
##D # pmid to doi/pmcid
##D id_converter("20495566", "pmid")
##D 
##D # pmcid to doi/pmid
##D id_converter("PMC2883744", "pmcid")
##D 
##D # error, wrong type passed for id given
##D # id_converter("PMC2883744", "doi")
## End(Not run)



