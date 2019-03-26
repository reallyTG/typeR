library(rgbif)


### Name: dataset_suggest
### Title: Suggest datasets in GBIF.
### Aliases: dataset_suggest

### ** Examples

## Not run: 
##D # Suggest datasets of type "OCCURRENCE".
##D dataset_suggest(query="Amazon", type="OCCURRENCE")
##D 
##D # Suggest datasets tagged with keyword "france".
##D dataset_suggest(keyword="france")
##D 
##D # Fulltext search for all datasets having the word "amsterdam" somewhere in
##D # its metadata (title, description, etc).
##D dataset_suggest(query="amsterdam")
##D 
##D # Limited search
##D dataset_suggest(type="OCCURRENCE", limit=2)
##D dataset_suggest(type="OCCURRENCE", limit=2, start=10)
##D 
##D # Return just descriptions
##D dataset_suggest(type="OCCURRENCE", limit = 5, description=TRUE)
##D 
##D # Return metadata in a more human readable way (hard to manipulate though)
##D dataset_suggest(type="OCCURRENCE", limit = 5, pretty=TRUE)
##D 
##D # Search by country code. Lookup isocodes first, and use US for United States
##D isocodes[agrep("UNITED", isocodes$gbif_name),]
##D dataset_suggest(country="US", limit = 25)
##D 
##D # Search by decade
##D dataset_suggest(decade=1980, limit = 30)
##D 
##D # Some parameters accept many inputs, treated as OR
##D dataset_suggest(type = c("metadata", "checklist"))
##D dataset_suggest(keyword = c("fern", "algae"))
##D dataset_suggest(publishingOrg = c("e2e717bf-551a-4917-bdc9-4fa0f342c530",
##D   "90fd6680-349f-11d8-aa2d-b8a03c50a862"))
##D dataset_suggest(hostingOrg = c("c5f7ef70-e233-11d9-a4d6-b8a03c50a862",
##D   "c5e4331-7f2f-4a8d-aa56-81ece7014fc8"))
##D dataset_suggest(publishingCountry = c("DE", "NZ"))
##D dataset_suggest(decade = c(1910, 1930))
##D 
##D # curl options
##D dataset_suggest(type="OCCURRENCE", limit = 2, curlopts = list(verbose=TRUE))
## End(Not run)



