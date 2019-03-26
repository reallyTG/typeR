library(europepmc)


### Name: epmc_details
### Title: Get details for individual records
### Aliases: epmc_details

### ** Examples

## Not run: 
##D epmc_details(ext_id = "26980001")
##D epmc_details(ext_id = "24270414")
##D 
##D # PMC record
##D epmc_details(ext_id = "PMC4747116", data_src = "pmc")
##D 
##D # Other sources:
##D # Agricolo
##D epmc_details("IND43783977", data_src = "agr")
##D # Biological Patents
##D epmc_details("EP2412369", data_src = "pat")
##D # Chinese Biological Abstracts
##D epmc_details("583843", data_src = "cba")
##D # CiteXplore
##D epmc_details("C6802", data_src = "ctx")
##D # NHS Evidence
##D epmc_details("338638", data_src = "hir")
##D # Theses
##D epmc_details("409323", data_src = "eth")
## End(Not run)



