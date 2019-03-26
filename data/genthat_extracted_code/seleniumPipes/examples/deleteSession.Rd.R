library(seleniumPipes)


### Name: deleteSession
### Title: Delete the session.
### Aliases: deleteSession

### ** Examples

## Not run: 
##D   # start a driver without opening a browser
##D   remDr <- remoteDr(newSession = FALSE)
##D 
##D   # open a broswer
##D   remDr %>% newSession
##D 
##D   # set timeout on waiting for elements
##D   remDr %>% setTimeout(type = "implicit", 5000)
##D 
##D   # close Session
##D   remDr %>% deleteSession
##D 
## End(Not run)




