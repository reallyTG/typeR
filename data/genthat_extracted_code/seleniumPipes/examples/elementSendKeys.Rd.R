library(seleniumPipes)


### Name: elementSendKeys
### Title: Send a sequence of key strokes to an element.
### Aliases: elementSendKeys

### ** Examples

## Not run: 
##D   # start a brower
##D   remDr <- remoteDr()
##D   remDr %>% go("http://www.google.com/ncr")
##D 
##D   queryBox <- remDr %>% findElement("name", "q")
##D 
##D   # send text to the query box
##D   queryBox %>% elementSendKeys("Some ", "text")
##D 
##D   # clear the query box
##D   queryBox %>% elementClear
##D 
##D   # get the search button
##D   searchBtn <- remDr %>% findElement("name", "btnG")
##D   # send text to query box
##D   queryBox %>% elementSendKeys("R project")
##D 
##D   # click the search button
##D   searchBtn %>% elementClick
##D 
##D   # close browser
##D   remDr %>% deleteSession
## End(Not run)



