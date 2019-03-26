library(seleniumPipes)


### Name: go
### Title: Navigate to a new URL.
### Aliases: go

### ** Examples

## Not run: 
##D   remDr <- remoteDr()
##D   remDr %>% go("http://www.google.com/ncr")
##D 
##D   # get the title
##D   remDr %>% getTitle
##D 
##D   # get the current page url
##D   remDr %>% getCurrentUrl
##D 
##D   # navigate
##D   remDr %>% go("http://www.bbc.co.uk")
##D 
##D   # go back
##D   remDr %>% (seleniumPipes::back)
##D 
##D   # go forward
##D   remDr %>% forward
##D 
##D   # refresh page
##D   remDr %>% refresh
##D 
##D   # close browser
##D   remDr %>% deleteSession
## End(Not run)




