library(RSelenium)


### Name: getChromeProfile
### Title: Get Chrome profile.
### Aliases: getChromeProfile

### ** Examples

## Not run: 
##D # example from windows using a profile directory "Profile 1"
##D cprof <- getChromeProfile(
##D   "C:\\Users\\john\\AppData\\Local\\Google\\Chrome\\User Data",
##D   "Profile 1"
##D )
##D remDr <- remoteDriver(browserName = "chrome", extraCapabilities = cprof)
## End(Not run)



