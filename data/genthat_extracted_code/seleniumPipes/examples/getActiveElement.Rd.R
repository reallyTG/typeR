library(seleniumPipes)


### Name: getActiveElement
### Title: Get the element on the page that currently has focus.
### Aliases: getActiveElement

### ** Examples

## Not run: 
##D   remDr <- remoteDr()
##D   remDr %>% go("http://www.google.com/ncr")
##D 
##D   # find the search form query box and search for "R project"
##D   webElem <- remDr %>% findElement("name", "q") %>%
##D     elementSendKeys("R project", key = "enter")
##D   # click the first link hopefully should be www.r-project.org
##D   remDr %>% findElement("css", "h3.r a") %>% elementClick
##D 
##D   # get the navigation div
##D   navElem <- remDr %>% findElement("css", "div[role='navigation']")
##D 
##D   # find all the links in this div
##D   navLinks <- navElem %>% findElementsFromElement("css", "a")
##D 
##D   # check the links
##D   nLinks <- sapply(navLinks, function(x) x %>% getElementText)
##D 
##D   # compare with all links
##D   allLinks <- remDr %>% findElements("css", "a")
##D   aLinks <- sapply(allLinks, function(x) x %>% getElementText)
##D 
##D   # show the effect of searching for elements from element
##D   aLinks %in% nLinks
##D 
##D   remDr %>% deleteSession
## End(Not run)




