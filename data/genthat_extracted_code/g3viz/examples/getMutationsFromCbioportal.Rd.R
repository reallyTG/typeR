library(g3viz)


### Name: getMutationsFromCbioportal
### Title: Query cancer genomic mutation data from cBioPortal
### Aliases: getMutationsFromCbioportal

### ** Examples

## Not run: 
##D # Note: internet access required.  May need more than 10 seconds.
##D # list all studies of cBioPortal
##D library(cgdsr)
##D cgds <- CGDS("http://www.cbioportal.org/public-portal/")
##D all.studies <- getCancerStudies(cgds)
##D 
##D # pick a "caner_study_id" (contain a mutation data set)
##D # pick a primary HGNC gene symbol to query
##D mutation.dat <- getMutationsFromCbioportal("msk_impact_2017", "TP53")
##D mutation.dat <- getMutationsFromCbioportal("all_stjude_2016", "TP53")
## End(Not run)



