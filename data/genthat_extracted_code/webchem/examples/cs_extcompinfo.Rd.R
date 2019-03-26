library(webchem)


### Name: cs_extcompinfo
### Title: Get extended record details by ChemSpider ID
### Aliases: cs_extcompinfo

### ** Examples

## Not run: 
##D # Fails because no TOKEN is included
##D token <- '<YOUR-SECURITY-TOKEN>'
##D csid <- get_csid("Triclosan", token = token)
##D cs_extcompinfo(csid, token)
##D 
##D csids <- get_csid(c('Aspirin', 'Triclosan'), token = token)
##D cs_compinfo(csids, token = token)
## End(Not run)



