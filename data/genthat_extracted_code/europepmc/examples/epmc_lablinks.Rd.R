library(europepmc)


### Name: epmc_lablinks
### Title: Get links to external sources
### Aliases: epmc_lablinks

### ** Examples

  ## Not run: 
##D   # Fetch links
##D   epmc_lablinks("24007304")
##D   # Link to Altmetric (lab_id = "1562")
##D   epmc_lablinks("25389392", lab_id = "1562")
##D 
##D   # Links to Wikipedia
##D   epmc_lablinks("24007304", lab_id = "1507")
##D 
##D   # Link to full text copy archived through the institutional repo of
##D   Bielefeld University
##D   epmc_lablinks("12736239", lab_id = "1056")
##D   
## End(Not run)



