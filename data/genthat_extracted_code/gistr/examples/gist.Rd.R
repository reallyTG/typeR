library(gistr)


### Name: gist
### Title: Get a gist
### Aliases: gist as.gist

### ** Examples

## Not run: 
##D gist('f1403260eb92f5dfa7e1')
##D 
##D as.gist('f1403260eb92f5dfa7e1')
##D as.gist(10)
##D as.gist(gist('f1403260eb92f5dfa7e1'))
##D 
##D # get a specific revision of a gist
##D id <- 'c1e2cb547d9f22bd314da50fe9c7b503'
##D gist(id, 'a5bc5c143beb697f23b2c320ff5a8dacf960b0f3')
##D gist(id, 'b70d94a8222a4326dff46fc85bc69d0179bd1da2')
##D gist(id, '648bb44ab9ae59d57b4ea5de7d85e24103717e8b')
##D gist(id, '0259b13c7653dc95e20193133bcf71811888cbe6')
##D 
##D # from a url, or partial url
##D x <- "https://gist.github.com/expersso/4ac33b9c00751fddc7f8"
##D x <- "gist.github.com/expersso/4ac33b9c00751fddc7f8"
##D x <- "gist.github.com/4ac33b9c00751fddc7f8"
##D x <- "expersso/4ac33b9c00751fddc7f8"
##D as.gist(x)
##D 
##D ids <- sapply(gists(), "[[", "id")
##D gist(ids[1])
##D gist(ids[2])
##D gist(ids[3])
##D gist(ids[4])
##D 
##D gist(ids[1]) %>% browse()
##D 
##D ## If a gist file is > a certain size it is truncated
##D ## in this case, we let you know in the return object that it is truncated
##D ## e.g.
##D (bigfile <- gist(id = "b74b878fd7d9176a4c52"))
##D ## then get the raw_url, and retrieve the file
##D url <- bigfile$files$`plossmall.json`$raw_url
##D # httr::GET(url)
## End(Not run)



