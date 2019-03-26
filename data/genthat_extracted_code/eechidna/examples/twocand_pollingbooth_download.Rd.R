library(eechidna)


### Name: twocand_pollingbooth_download
### Title: Download two candidate preference voting data from each polling
###   booth, from the five Australian Federal elections between 2004 and
###   2016.
### Aliases: twocand_pollingbooth_download

### ** Examples

## Not run: 
##D tcp_pp <- twocand_pollingbooth_download()
##D library(dplyr)
##D tcp_pp %>% filter(year == 2016) %>% arrange(-OrdinaryVotes) %>% head
## End(Not run)




