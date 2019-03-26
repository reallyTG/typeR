library(neotoma)


### Name: compile_taxa
### Title: Function to convert assemblage taxa to standardized lists.
### Aliases: compile_taxa
### Keywords: utilities

### ** Examples

## Not run: 
##D #  Search for sites with "Thuja" pollen that are older than 8kyr BP and
##D #  that are on the west coast of North America:
##D t8kyr.datasets <- get_dataset(taxonname='Thuja*', loc=c(-150, 20, -100, 60), ageyoung = 8000)
##D 
##D #  Returns 3 records (as of 04/04/2013), get dataset for the first record, Gold Lake Bog.
##D GOLDKBG <- get_download(t8kyr.datasets[[1]])
##D 
##D gold.p25 <- compile_taxa(GOLDKBG, 'P25')
##D 
## End(Not run)



