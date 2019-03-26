library(seleniumPipes)


### Name: getElementRect
### Title: Return the dimensions and coordinates of an element
### Aliases: getElementRect

### ** Examples

## Not run: 
##D   remDr <- remoteDr()
##D   remDr %>% go("http://www.google.com/ncr")
##D 
##D   # select the search box
##D   searchElem <- remDr %>% findElement("name", "q")
##D 
##D   # get the name of our element
##D   searchElem %>% getElementAttribute("name")
##D 
##D   # get the css background-color
##D   searchElem %>% getElementCssValue("background-color")
##D   blueScript <- "arguments[0].style.backgroundColor = 'blue';"
##D   remDr %>% executeScript(blueScript, list(searchElem))
##D   searchElem %>% getElementCssValue("background-color")
##D 
##D   # get the javascript property
##D   # searchElem %>% getElementProperty("backgroundColor")
##D 
##D   # get dimensions
##D   searchElem %>% getElementRect
##D 
##D   searchElem %>% getElementTagName
##D 
##D   # get some text and return it
##D   remDr %>% go("http://r-project.org")
##D   remDr %>% findElement("css", "h1") %>% getElementText
##D 
##D   # close browser
##D   remDr %>% deleteSession
## End(Not run)




