library(rsunlight)


### Name: os_legislatorsearch
### Title: Search Legislators on OpenStates.
### Aliases: os_legislatorsearch

### ** Examples

## Not run: 
##D os_legislatorsearch(state = 'ca', party = 'democratic')
##D os_legislatorsearch(state = 'tx', party = 'democratic', active = TRUE)
##D os_legislatorsearch(state = 'nv', party = 'republican')
##D os_legislatorsearch(state = 'dc', chamber = 'upper')
##D 
##D # pass in more than one value for some parameters
##D os_legislatorsearch(state = c('dc', 'or'), chamber = 'upper')
##D os_legislatorsearch(first_name = c('jane', 'bob'), chamber = 'upper')
## End(Not run)



