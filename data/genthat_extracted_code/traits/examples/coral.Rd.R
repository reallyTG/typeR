library(traits)


### Name: coral
### Title: Search for coral data on coraltraits.org
### Aliases: coral coral_taxa coral_traits coral_locations
###   coral_methodologies coral_resources coral_species

### ** Examples

## Not run: 
##D # Get the species and their Ids
##D head( coral_species() )
##D 
##D # Get data by taxon
##D coral_taxa(8)
##D 
##D # Get data by trait
##D coral_traits(3)
##D 
##D # Get data by methodology
##D coral_methodologies(2)
##D 
##D # Get data by location
##D coral_locations(132)
##D 
##D # Get data by resource
##D coral_resources(9)
##D 
##D # curl options
##D library("httr")
##D coral_taxa(8, config=verbose())
## End(Not run)



