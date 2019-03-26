library(webchem)


### Name: cs_compinfo
### Title: Get record details (CSID, StdInChIKey, StdInChI, SMILES) by
###   ChemSpider ID
### Aliases: cs_compinfo

### ** Examples

## Not run: 
##D # Fails because no TOKEN is included
##D token <- '<YOUR-SECURITY-TOKEN>'
##D csid <- get_csid("Triclosan", token = token)
##D cs_compinfo(csid, token)
##D 
##D csids <- get_csid(c('Aspirin', 'Triclosan'), token = token)
##D cs_compinfo(csids, token = token)
## End(Not run)



