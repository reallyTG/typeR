library(eechidna)


### Name: twoparty_pollingbooth_download
### Title: Download two party preference voting data from each polling
###   booth, from the six Australian Federal elections between 2001 and
###   2016.
### Aliases: twoparty_pollingbooth_download

### ** Examples

## Not run: 
##D tpp_pp <- twoparty_pollingbooth_download()
##D library(dplyr)
##D tpp_pp %>% filter(year == 2016) %>% arrange(-LNP_Percent) %>% head
## End(Not run)




