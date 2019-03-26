library(eechidna)


### Name: firstpref_pollingbooth_download
### Title: Download first preference voting data from each polling booth,
###   from the six Australian Federal elections between 2001 and 2016.
### Aliases: firstpref_pollingbooth_download

### ** Examples

## Not run: 
##D fp_pp <- firstpref_pollingbooth_download()
##D library(dplyr)
##D fp_pp %>% filter(year == 2016) %>% arrange(-OrdinaryVotes) %>% head
## End(Not run)




