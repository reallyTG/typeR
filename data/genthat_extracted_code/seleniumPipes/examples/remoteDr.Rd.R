library(seleniumPipes)


### Name: remoteDr
### Title: Create a remote driver
### Aliases: remoteDr

### ** Examples

## Not run: 
##D # assume a server is available at the default location.
##D remDr <- remoteDr()
##D remDR %>% go("http://www.google.com") %>%
##D  findElement("name", "q") %>%
##D  elementSendKeys("R project", key = "enter")
##D # close our browser
##D remDr %>% deleteSession
## End(Not run)




