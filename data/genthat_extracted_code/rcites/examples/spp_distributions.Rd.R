library(rcites)


### Name: spp_distributions
### Title: Get distributions data available for a given taxon concept.
### Aliases: spp_distributions

### ** Examples

## No test: 
 res1 <- spp_distributions(taxon_id = '4521')
 res2 <- spp_distributions(taxon_id = c('4521', '3210', '10255'))
 res3 <- spp_distributions(taxon_id = '4521', raw = TRUE)
 res4 <- spp_distributions(taxon_id = '4521', language = 'fr',
 verbose = FALSE, config = httr::progress())
## End(No test)



