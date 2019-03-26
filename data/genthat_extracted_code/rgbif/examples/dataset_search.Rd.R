library(rgbif)


### Name: dataset_search
### Title: Search datasets in GBIF.
### Aliases: dataset_search

### ** Examples

## Not run: 
##D # Gets all datasets of type "OCCURRENCE".
##D dataset_search(type="OCCURRENCE", limit = 10)
##D 
##D # Fulltext search for all datasets having the word "amsterdam" somewhere in
##D # its metadata (title, description, etc).
##D dataset_search(query="amsterdam", limit = 10)
##D 
##D # Limited search
##D dataset_search(type="OCCURRENCE", limit=2)
##D dataset_search(type="OCCURRENCE", limit=2, start=10)
##D 
##D # Return just descriptions
##D dataset_search(type="OCCURRENCE", return="descriptions", limit = 10)
##D 
##D # Return metadata in a more human readable way (hard to manipulate though)
##D dataset_search(type="OCCURRENCE", pretty=TRUE, limit = 10)
##D 
##D # Search by country code. Lookup isocodes first, and use US for United States
##D isocodes[agrep("UNITED", isocodes$gbif_name),]
##D dataset_search(country="US", limit = 10)
##D 
##D # Search by decade
##D dataset_search(decade=1980, limit = 10)
##D 
##D # Faceting
##D ## just facets
##D dataset_search(facet="decade", facetMincount="10", limit=0)
##D 
##D ## data and facets
##D dataset_search(facet="decade", facetMincount="10", limit=2)
##D 
##D # Some parameters accept many inputs, treated as OR
##D dataset_search(type = c("metadata", "checklist"))$data
##D dataset_search(keyword = c("fern", "algae"))$data
##D dataset_search(publishingOrg = c("e2e717bf-551a-4917-bdc9-4fa0f342c530",
##D   "90fd6680-349f-11d8-aa2d-b8a03c50a862"))$data
##D dataset_search(hostingOrg = c("c5f7ef70-e233-11d9-a4d6-b8a03c50a862",
##D   "c5e4331-7f2f-4a8d-aa56-81ece7014fc8"))$data
##D dataset_search(publishingCountry = c("DE", "NZ"))$data
##D dataset_search(decade = c(1910, 1930))$data
##D 
##D ## curl options
##D dataset_search(facet="decade", facetMincount="10", limit=2,
##D   curlopts = list(verbose=TRUE))
## End(Not run)



