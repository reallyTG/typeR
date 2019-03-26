library(rcites)


### Name: spp_cites_legislation
### Title: Get current CITES appendix listings and reservations.
### Aliases: spp_cites_legislation

### ** Examples

## No test: 
res1 <- spp_cites_legislation(taxon_id = 4521)
res2 <- spp_cites_legislation(taxon_id = c('4521', '3210', '10255'))
res3 <- spp_cites_legislation(taxon_id = 4521, scope = 'all',
verbose = FALSE, config=httr::verbose())
res4 <- spp_cites_legislation(taxon_id = 4521, language = 'fr')
## End(No test)



