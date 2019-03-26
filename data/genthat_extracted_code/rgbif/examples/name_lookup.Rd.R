library(rgbif)


### Name: name_lookup
### Title: Lookup names in all taxonomies in GBIF.
### Aliases: name_lookup

### ** Examples

## Not run: 
##D # Look up names like mammalia
##D name_lookup(query='mammalia', limit = 20)
##D 
##D # Start with an offset
##D name_lookup(query='mammalia', limit=1)
##D name_lookup(query='mammalia', limit=1, start=2)
##D 
##D # large requests (paging is internally implemented).
##D # hard maximum limit set by GBIF API: 99999
##D # name_lookup(query = "Carnivora", limit = 10000)
##D 
##D # Get all data and parse it, removing descriptions which can be quite long
##D out <- name_lookup('Helianthus annuus', rank="species", verbose=TRUE)
##D lapply(out$data, function(x) {
##D   x[!names(x) %in% c("descriptions","descriptionsSerialized")]
##D })
##D 
##D # Search for a genus, returning just data
##D name_lookup(query='Cnaemidophorus', rank="genus", return="data")
##D 
##D # Just metadata
##D name_lookup(query='Cnaemidophorus', rank="genus", return="meta")
##D 
##D # Just hierarchies
##D name_lookup(query='Cnaemidophorus', rank="genus", return="hierarchy")
##D 
##D # Just vernacular (common) names
##D name_lookup(query='Cnaemidophorus', rank="genus", return="names")
##D 
##D # Limit records to certain number
##D name_lookup('Helianthus annuus', rank="species", limit=2)
##D 
##D # Query by habitat
##D name_lookup(habitat = "terrestrial", limit=2)
##D name_lookup(habitat = "marine", limit=2)
##D name_lookup(habitat = "freshwater", limit=2)
##D 
##D # Using faceting
##D name_lookup(facet='status', limit=0, facetMincount='70000')
##D name_lookup(facet=c('status','higherTaxonKey'), limit=0,
##D   facetMincount='700000')
##D 
##D name_lookup(facet='nameType', limit=0)
##D name_lookup(facet='habitat', limit=0)
##D name_lookup(facet='datasetKey', limit=0)
##D name_lookup(facet='rank', limit=0)
##D name_lookup(facet='isExtinct', limit=0)
##D 
##D name_lookup(isExtinct=TRUE, limit=0)
##D 
##D # text highlighting
##D ## turn on highlighting
##D res <- name_lookup(query='canada', hl=TRUE, limit=5)
##D res$data
##D name_lookup(query='canada', hl=TRUE, limit=45, return='data')
##D ## and you can pass the output to gbif_names() function
##D res <- name_lookup(query='canada', hl=TRUE, limit=5)
##D gbif_names(res)
##D 
##D # Lookup by datasetKey (set up sufficient high limit, API maximum: 99999)
##D # name_lookup(datasetKey='3f8a1297-3259-4700-91fc-acc4170b27ce',
##D #   limit = 50000)
##D 
##D # Some parameters accept many inputs, treated as OR
##D name_lookup(rank = c("family", "genus"))
##D name_lookup(higherTaxonKey = c("119", "120", "121", "204"))
##D name_lookup(status = c("misapplied", "synonym"))$data
##D name_lookup(habitat = c("marine", "terrestrial"))
##D name_lookup(nameType = c("cultivar", "doubtful"))
##D name_lookup(datasetKey = c("73605f3a-af85-4ade-bbc5-522bfb90d847",
##D   "d7c60346-44b6-400d-ba27-8d3fbeffc8a5"))
##D name_lookup(datasetKey = "289244ee-e1c1-49aa-b2d7-d379391ce265",
##D   origin = c("SOURCE", "DENORMED_CLASSIFICATION"))
##D 
##D # Pass on curl options
##D name_lookup(query='Cnaemidophorus', rank="genus",
##D   curlopts = list(verbose = TRUE))
## End(Not run)



