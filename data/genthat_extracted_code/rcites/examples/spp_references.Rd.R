library(rcites)


### Name: spp_references
### Title: Get references for a given taxon concept
### Aliases: spp_references

### ** Examples

## No test: 
res1 <- spp_references(taxon_id = '4521')
res2 <- spp_references(c('4521', '3210', '10255'))
res3 <- spp_references(taxon_id = '4521', raw = TRUE, verbose = FALSE,
 config = httr::progress())
## End(No test)



