library(rsnps)


### Name: annotations
### Title: Get all openSNP phenotypes, their variations, and how many users
###   have data available for a given phenotype.
### Aliases: annotations

### ** Examples

## Not run: 
##D # Get all data
##D ## get just the metadata
##D annotations(snp = 'rs7903146', output = 'metadata')
##D 
##D ## just from plos
##D annotations(snp = 'rs7903146', output = 'plos') 
##D 
##D ## just from snpedia
##D annotations(snp = 'rs7903146', output = 'snpedia')
##D 
##D ## get all annotations
##D annotations(snp = 'rs7903146', output = 'all') 
## End(Not run)



