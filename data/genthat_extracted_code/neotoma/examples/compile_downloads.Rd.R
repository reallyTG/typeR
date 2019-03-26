library(neotoma)


### Name: compile_downloads
### Title: Compile download objects
### Aliases: compile_downloads
### Keywords: utilities

### ** Examples

## Not run: 
##D #  Search for sites with "Thuja" pollen that are older than 8kyr BP and
##D #  that are on the west coast of North America:
##D t8kyr.datasets <- get_dataset(taxonname='Thuja*', 
##D                               loc=c(-150, 20, -100, 60), 
##D                               ageyoung = 8000)
##D 
##D #  Returns 3 records (as of 04/04/2013), get dataset for the first record, 
##D #  Gold Lake Bog.
##D thuja.sites <- get_download(t8kyr.datasets)
##D 
##D gold.p25 <- compile_taxa(thuja.sites, 'P25')
##D 
##D all.gold <- compile_downloads(gold.p25)
##D 
##D pollen.sums <- rowSums(all.gold[,11:ncol(all.gold)], na.rm=TRUE)
##D 
##D plot(x = all.gold$age, 
##D      y = all.gold$Cupressaceae.Taxaceae / pollen.sums, 
##D      col = all.gold$site.name,
##D      pch = 19)
##D 
## End(Not run)



