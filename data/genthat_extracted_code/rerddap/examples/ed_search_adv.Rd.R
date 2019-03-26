library(rerddap)


### Name: ed_search_adv
### Title: Advanced search for ERDDAP tabledep or griddap datasets
### Aliases: ed_search_adv

### ** Examples

## Not run: 
##D ed_search_adv(query = 'temperature')
##D ed_search_adv(query = 'temperature', protocol = "griddap")
##D ed_search_adv(query = 'temperature', protocol = "tabledap")
##D ed_search_adv(maxLat = 63, minLon = -107, maxLon = -87, minLat = 50,
##D   protocol = "griddap")
##D ed_search_adv(maxLat = 63, minLon = -107, maxLon = -87, minLat = 50,
##D   protocol = "tabledap")
##D ed_search_adv(minTime = "2010-01-01T00:00:00Z",
##D   maxTime="2010-02-01T00:00:00Z")
##D (out <- ed_search_adv(maxLat = 63, minLon = -107, maxLon = -87, minLat = 50,
##D              minTime = "2010-01-01T00:00:00Z",
##D              maxTime="2010-02-01T00:00:00Z"))
##D out$alldata[[1]]
##D ed_search_adv(variableName = 'upwelling')
##D ed_search_adv(query = 'upwelling', protocol = "tabledap")
##D 
##D # use a different URL
##D ed_search_adv(query = 'temperature', url = servers()$url[6])
## End(Not run)



