library(rgbif)


### Name: datasets
### Title: Search for datasets and dataset metadata.
### Aliases: datasets

### ** Examples

## Not run: 
##D datasets(limit=5)
##D datasets(type="occurrence", limit=10)
##D datasets(uuid="a6998220-7e3a-485d-9cd6-73076bd85657")
##D datasets(data='contact', uuid="a6998220-7e3a-485d-9cd6-73076bd85657")
##D datasets(data='metadata', uuid="a6998220-7e3a-485d-9cd6-73076bd85657")
##D datasets(data='metadata', uuid="a6998220-7e3a-485d-9cd6-73076bd85657",
##D   id=598)
##D datasets(data=c('deleted','duplicate'))
##D datasets(data=c('deleted','duplicate'), limit=1)
##D 
##D # curl options
##D datasets(data=c('deleted','duplicate'), curlopts = list(verbose=TRUE))
## End(Not run)



