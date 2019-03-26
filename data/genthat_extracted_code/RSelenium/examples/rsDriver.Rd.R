library(RSelenium)


### Name: rsDriver
### Title: Start a selenium server and browser
### Aliases: rsDriver

### ** Examples

## Not run: 
##D # start a chrome browser
##D rD <- rsDriver()
##D remDr <- rD[["client"]]
##D remDr$navigate("http://www.google.com/ncr")
##D remDr$navigate("http://www.bbc.com")
##D remDr$close()
##D # stop the selenium server
##D rD[["server"]]$stop()
##D 
##D # if user forgets to stop server it will be garbage collected.
##D rD <- rsDriver()
##D rm(rD)
##D gc(rD)
## End(Not run)



