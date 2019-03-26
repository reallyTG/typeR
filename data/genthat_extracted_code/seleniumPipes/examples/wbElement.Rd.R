library(seleniumPipes)


### Name: wbElement
### Title: Create a Web Element
### Aliases: wbElement

### ** Examples

## Not run: 
##D remDr <- remoteDr()
##D webElem <- remDR %>% go("http://www.google.com") %>%
##D  findElement("name", "q")
##D # print the webElement
##D webElem
##D 
##D # send keys to the web Element
##D webElem %>%  elementSendKeys("R project", key = "enter")
##D 
##D # close browser
##D remDr %>% deleteSession()
## End(Not run)



