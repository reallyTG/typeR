library(rcites)


### Name: spp_eu_legislation
### Title: Get current EU annex listings, SRG opinions, and EU suspensions.
### Aliases: spp_eu_legislation

### ** Examples

## No test: 
res1 <- spp_eu_legislation(taxon_id = '4521')
res2 <- spp_eu_legislation(taxon_id = c('4521', '3210', '10255'))
res3 <- spp_eu_legislation(taxon_id = '4521', scope = 'historic')
res4 <- spp_eu_legislation(taxon_id = '4521', scope = 'all', language='fr',
 verbose = FALSE, config=httr::verbose())
## End(No test)



