library(RSelenium)


### Name: makeFirefoxProfile
### Title: Make Firefox profile.
### Aliases: makeFirefoxProfile

### ** Examples

## Not run: 
##D fprof <- makeFirefoxProfile(list(browser.download.dir = "D:/temp"))
##D remDr <- remoteDriver(extraCapabilities = fprof)
##D remDr$open()
## End(Not run)



