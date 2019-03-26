library(neotoma)


### Name: counts
### Title: Access proxy count data
### Aliases: counts counts.download counts.download_list

### ** Examples

## Not run: 
##D marion <- get_site('Marion Lake%')
##D louise <- get_site('Louise Pond%')
##D western.sites <- rbind(marion, louise)
##D western.data  <- get_dataset(western.sites)
##D 
##D western.dl <- get_download(western.data)
##D western.cnt <- counts(western.dl)
##D sapply(western.cnt, dim)
##D marion.cnt<- counts(western.dl[[1]])
##D dim(marion.cnt)
## End(Not run)



