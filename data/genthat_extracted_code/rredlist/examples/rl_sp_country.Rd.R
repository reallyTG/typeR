library(rredlist)


### Name: rl_sp_country
### Title: Get species by country
### Aliases: rl_sp_country rl_sp_country_

### ** Examples

## Not run: 
##D rl_sp_country('AZ')
##D rl_sp_country('NZ')
##D 
##D # don't parse to data.frame, gives list
##D rl_sp_country('NZ', parse = FALSE)
##D # don't parse at all, get json back
##D rl_sp_country_('NZ')
##D 
##D # curl options
##D res <- rl_sp_country('NZ', verbose = TRUE)
## End(Not run)



