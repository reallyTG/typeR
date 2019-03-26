library(httping)


### Name: ping
### Title: Ping a url, doing a single call, with any http verbs
### Aliases: ping

### ** Examples

## Not run: 
##D "https://mockbin.com/request" %>% ping()
##D ping("https://mockbin.com/request")
##D "https://mockbin.com/request" %>% ping(config=verbose())
##D ping("https://mockbin.com/request", config=verbose())
##D "https://mockbin.com/request" %>% ping(config=c(verbose(), accept_json()))
##D 
##D "https://mockbin.com/request" %>% ping()
##D "https://mockbin.com/request" %>% ping(verb=HEAD)
##D "https://mockbin.com/request" %>% ping(verb=PUT)
##D "https://google.com" %>% ping()
##D 
##D # pass just a port number, tries to resolve, fails if not found
##D # "9200" %>% ping()
##D # 9200 %>% ping()
##D # 9200 %>% ping(verb=POST)
##D # 9200 %>% ping(verb=HEAD)
##D # ping(9200)
##D # ping("9200")
## End(Not run)



