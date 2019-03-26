library(rcites)


### Name: spp_taxonconcept
### Title: Get taxon concepts for a search term.
### Aliases: spp_taxonconcept

### ** Examples

## No test: 
res1 <- spp_taxonconcept(query_taxon = 'Loxodonta africana')
res2 <- spp_taxonconcept(query_taxon = 'Amazilia versicolor', raw = TRUE)
res3 <- spp_taxonconcept(query_taxon = '', taxonomy = 'CMS', pages = c(1, 3),
 language = 'EN', verbose = FALSE, config = httr::progress())
res4 <- spp_taxonconcept(query_taxon = '', per_page = 20, pages = 44)
## End(No test)



