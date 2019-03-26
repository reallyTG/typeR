library(neotoma)


### Name: get_dataset
### Title: Obtain dataset information from the Neotoma Paleoecological
###   Database or an existing object.
### Aliases: get_dataset
### Keywords: IO connection

### ** Examples

## Not run: 
##D # Search for sites with "Thuja" pollen that are older than 8kyr BP and
##D # that are on the west coast of North America:
##D t8kyr.datasets <- get_dataset(taxonname='Thuja*', 
##D                               loc=c(-150, 20, -100, 60), 
##D                               ageyoung = 8000)
##D 
##D # Search for vertebrate fossils in Canada (gpid: 756) within the last 2kyr.
##D gpids <- get_table(table.name='GeoPoliticalUnits')
##D canID <- gpids[which(gpids$GeoPoliticalName == 'Canada'),1]
##D 
##D v2kyr.datasets <- get_dataset(datasettype='vertebrate fauna', 
##D                               gpid=canID, 
##D                               ageold = 2000)
## End(Not run)



