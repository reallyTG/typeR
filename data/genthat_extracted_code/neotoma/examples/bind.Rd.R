library(neotoma)


### Name: bind
### Title: Function to bind objects together into a longer object.
### Aliases: bind
### Keywords: utilities

### ** Examples

## Not run: 
##D #  Search for sites with "Thuja" pollen that are older than 8kyr BP and
##D #  that are on the west coast of North America:
##D t8kyr.poa <- get_dataset(taxonname="Thuja*", 
##D                          loc=c(-150, 20, -100, 60), ageyoung = 8000)
##D t8kyr.canis <- get_dataset(taxonname="Canis*", 
##D                            loc=c(-150, 20, -100, 60), ageyoung = 8000)
##D 
##D t8kyr.co_site <- bind(t8kyr.poa, t8kyr.canis)
##D plot(t8kyr.co_site)
##D 
##D ####
##D # We want to look at four different dataset types across a forest-prairie 
##D # boundary:
##D dataset_types <- c("ostracode surface sample",
##D                    "water chemistry",
##D                    "diatom surface sample",
##D                    "pollen surface sample")
##D 
##D # Run the `get_dataset` function for each of the different dataset types 
##D dataset_lists <- lapply(dataset_types, 
##D                           function(x) { 
##D                             get_dataset(datasettype=x, 
##D                                         loc = c(-100,43,-92,48))
##D                                         })
##D 
##D # Using do.call here to make sure that I don't have to split the list out.
##D new_datasets <- do.call(bind, dataset_lists)
##D 
##D # And voila!
##D plot(new_datasets)
##D 
## End(Not run)



