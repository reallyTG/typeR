library(neotoma)


### Name: get_geochron
### Title: Function to return geochronological data from records.
### Aliases: get_geochron
### Keywords: IO connection

### ** Examples

## Not run: 
##D #  Search for the sites around Marion Lake, BC.  I want to find sites within 
##D #  about 1km.
##D 
##D marion <- get_site(sitename = "Marion Lake*")
##D 
##D marion_close <- get_closest(marion, n = 10, buffer = 1)
##D 
##D #  Returns 116 records (as of 13/07/2015).  These are the pollen records though, 
##D #  we want the sites:
##D geochron.records <- get_geochron(marion_close)
##D 
##D #  We want to extract all the radiocarbon ages from the records:
##D 
##D get_ages <- function(x){
##D   any.ages <- try(x[[2]]$age[x[[2]]$age.type == 'Radiocarbon years BP'])
##D   if(class(any.ages) == 'try-error') output <- NA
##D   if(!class(any.ages) == 'try-error') output <- unlist(any.ages)
##D   output
##D }
##D 
##D radio.chron <- unlist(sapply(geochron.records, get_ages))
##D 
##D hist(radio.chron[radio.chron<40000], breaks=seq(0, 25000, by = 1000),
##D      main = 'Radiocarbon dates for Pseudotsuga records',
##D      xlab = 'Radiocarbon date (14C years before 1950)')
## End(Not run)




