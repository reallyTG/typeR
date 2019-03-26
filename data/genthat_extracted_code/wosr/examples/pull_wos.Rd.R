library(wosr)


### Name: pull_wos
### Title: Pull data from the Web of Science
### Aliases: pull_wos

### ** Examples

## Not run: 
##D 
##D sid <- auth("your_username", password = "your_password")
##D pull_wos("TS = (dog welfare) AND PY = 2010", sid = sid)
##D 
##D # Re-use session ID. This is best practice to avoid throttling limits:
##D pull_wos("TI = \"dog welfare\"", sid = sid)
##D 
##D # Get fresh session ID:
##D pull_wos("TI = \"pet welfare\"", sid = auth("your_username", "your_password"))
##D 
##D # It's best to see how many records your query matches before actually
##D # downloading the data. To do this, call query_wos before running pull_wos:
##D query <- "TS = ((cadmium AND gill*) NOT Pisces)"
##D query_wos(query, sid = sid) # shows that there are 1,611 matching publications
##D pull_wos(query, sid = sid)
## End(Not run)



