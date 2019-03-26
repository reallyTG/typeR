library(rgbif)


### Name: gbif_oai
### Title: GBIF registry data via OAI-PMH
### Aliases: gbif_oai gbif_oai_identify gbif_oai_list_identifiers
###   gbif_oai_list_records gbif_oai_list_metadataformats
###   gbif_oai_list_sets gbif_oai_get_records

### ** Examples

## Not run: 
##D gbif_oai_identify()
##D 
##D today <- format(Sys.Date(), "%Y-%m-%d")
##D gbif_oai_list_identifiers(from = today)
##D gbif_oai_list_identifiers(set = "country:NL")
##D 
##D gbif_oai_list_records(from = today)
##D gbif_oai_list_records(set = "country:NL")
##D 
##D gbif_oai_list_metadataformats()
##D gbif_oai_list_metadataformats(id = "9c4e36c1-d3f9-49ce-8ec1-8c434fa9e6eb")
##D 
##D gbif_oai_list_sets()
##D gbif_oai_list_sets(as = "list")
##D 
##D gbif_oai_get_records("9c4e36c1-d3f9-49ce-8ec1-8c434fa9e6eb")
##D ids <- c("9c4e36c1-d3f9-49ce-8ec1-8c434fa9e6eb",
##D          "e0f1bb8a-2d81-4b2a-9194-d92848d3b82e")
##D gbif_oai_get_records(ids)
## End(Not run)



