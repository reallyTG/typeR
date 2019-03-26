library(request)


### Name: api_config
### Title: Curl settings
### Aliases: api_config

### ** Examples

## Not run: 
##D # Config handler
##D api('http://api.crossref.org/works') %>%
##D  api_config(verbose(), progress()) %>%
##D  peep()
##D 
##D xx <- api('http://api.crossref.org') %>%
##D   api_path(works, 10.3897/zookeys.515.9459) %>%
##D   api_config(verbose())
## End(Not run)



