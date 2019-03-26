library(RSelenium)


### Name: phantom
### Title: Start a phantomjs binary in webdriver mode.
### Aliases: phantom

### ** Examples

## Not run: 
##D pJS <- phantom()
##D # note we are running here without a selenium server phantomjs is
##D # listening on port 4444
##D # in webdriver mode
##D remDr <- remoteDriver(browserName = "phantomjs")
##D remDr$open()
##D remDr$navigate("http://www.google.com/ncr")
##D remDr$screenshot(display = TRUE)
##D webElem <- remDr$findElement("name", "q")
##D webElem$sendKeysToElement(list("HELLO WORLD"))
##D remDr$screenshot(display = TRUE)
##D remDr$close()
##D # note remDr$closeServer() is not called here. We stop the phantomjs
##D # binary using
##D pJS$stop()
## End(Not run)



