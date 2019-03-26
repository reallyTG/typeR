library(rphylopic)


### Name: name
### Title: Perform actions with names.
### Aliases: name name_get name_images name_minsuptaxa name_search
###   name_taxonomy name_taxonomy_many name_taxonomy_sources

### ** Examples

## Not run: 
##D # parse as different outputs
##D name_taxonomy(uuid = "f3254fbd-284f-46c1-ae0f-685549a6a373", 
##D    options = "string", as="table")
##D name_taxonomy(uuid = "f3254fbd-284f-46c1-ae0f-685549a6a373", 
##D    options = "string", as="list")
##D name_taxonomy(uuid = "f3254fbd-284f-46c1-ae0f-685549a6a373", 
##D    options = "string", as="json")
##D 
##D # Get info on a name
##D id <- "1ee65cf3-53db-4a52-9960-a9f7093d845d"
##D name_get(uuid = id)
##D name_get(uuid = id, options=c('citationStart','html'))
##D name_get(uuid = id, options=c('namebankID','root','votes'))
##D 
##D # Searches for images for a taxonomic name.
##D name_images(uuid = "1ee65cf3-53db-4a52-9960-a9f7093d845d")
##D name_images(uuid = "1ee65cf3-53db-4a52-9960-a9f7093d845d", 
##D    options='credit')
##D 
##D # Finds the minimal common supertaxa for a list of names.
##D name_minsuptaxa(uuid=c("1ee65cf3-53db-4a52-9960-a9f7093d845d",
##D    "08141cfc-ef1f-4d0e-a061-b1347f5297a0"))
##D 
##D # Finds the taxa whose names match a piece of text.
##D name_search(text = "Homo sapiens")
##D name_search(text = "Homo sapiens", options = "names")
##D name_search(text = "Homo sapiens", options = "type")
##D name_search(text = "Homo sapiens", options = "namebankID")
##D name_search(text = "Homo sapiens", options = "root")
##D name_search(text = "Homo sapiens", options = "uri")
##D name_search(text = "Homo sapiens", options = c("string","type","uri"))
##D 
##D # Collects taxonomic data for a name.
##D name_taxonomy(uuid = "f3254fbd-284f-46c1-ae0f-685549a6a373", 
##D    options = "string")
##D name_taxonomy(uuid = "f3254fbd-284f-46c1-ae0f-685549a6a373", 
##D    supertaxa="immediate", options=c("string","namebankID"))
##D name_taxonomy(uuid = "f3254fbd-284f-46c1-ae0f-685549a6a373", supertaxa="all", 
##D    options="string")
##D name_taxonomy(uuid = "f3254fbd-284f-46c1-ae0f-685549a6a373", supertaxa="all", 
##D    options=c("string","uri"))
##D 
##D # Collects taxonomic data for multiple names.
##D name_taxonomy_many(uuid = c("f3254fbd-284f-46c1-ae0f-685549a6a373", 
##D  "1ee65cf3-53db-4a52-9960-a9f7093d845d"))
##D 
##D # Collects data about the sources for a name's taxonomy.
##D name_taxonomy_sources(uuid = "f3254fbd-284f-46c1-ae0f-685549a6a373")
##D name_taxonomy_sources(uuid = "f3254fbd-284f-46c1-ae0f-685549a6a373", 
##D   as="json")
##D name_taxonomy_sources(uuid = "1ee65cf3-53db-4a52-9960-a9f7093d845d")
## End(Not run)



