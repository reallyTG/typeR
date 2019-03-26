library(RSauceLabs)


### Name: getJsUnitTestStatus
### Title: Get JS Unit Test Status
### Aliases: getJsUnitTestStatus

### ** Examples

## Not run: 
##D # use test example from
##D #https://wiki.saucelabs.com/display/DOCS/JavaScript+Unit+Testing+Methods
##D platforms <- list(c("Windows 7", "firefox", "27"),
##D                     c("Linux", "googlechrome", "")
##D                     )
##D appUrl <- "https://saucelabs.com/test_helpers/front_tests/index.html"
##D framework <- "jasmine"
##D myAcc <- account()
##D myTest <- startJsUnitTests(myAcc, platforms = platforms, url = appUrl, framework = framework)
##D 
##D #> unlist(myTest, use.names = FALSE)
##D #[1] "bc8b9ef6e6184ed8a7e5270344115999" "bf43cef30bca429eaa2ed08da09dbdce"
##D testIds <- unlist(myTest, use.names = FALSE)
##D testRes <- getJsUnitTestStatus(myAcc,js_tests = testIds)
##D 
## End(Not run)



