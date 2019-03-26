library(antaresRead)


### Name: getLinks
### Title: Retrieve links connected to a set of areas
### Aliases: getLinks

### ** Examples

## Not run: 
##D # Get all links of a study
##D getLinks()
##D 
##D # Get all links with their origin and their destination
##D 
##D # Get all links connected to french areas (assuming their name contains "fr")
##D getLinks(getAreas("fr"))
##D 
##D # Same but with only links connecting two french areas
##D getLinks(getAreas("fr"), internalOnly = TRUE)
##D 
##D # Exclude links connecting real areas with pumped storage virtual areas
##D # (assuming their name contains "psp")
##D getLinks(getAreas("fr"), exclude = getAreas("psp"))
##D 
## End(Not run)




