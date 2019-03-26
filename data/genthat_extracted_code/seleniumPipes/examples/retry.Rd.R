library(seleniumPipes)


### Name: retry
### Title: Documetation of retry argument
### Aliases: retry

### ** Examples

## Not run: 
##D remDr <- remoteDr()
##D webElem <- remDr %>% go("http://www.google.com/ncr") %>%
##D   findElement("name", "q")
##D # change the name of q with an 8 second delay
##D myscript <- "var myElem = arguments[0];
##D window.setTimeout(function(){
##D  myElem.setAttribute('name','funkyname');
##D }, 8000);"
##D remDr %>% executeScript(myscript, args = list(webElem))
##D 
##D newWebElem <- remDr %>% findElement("name", "funkyname")
##D 
##D # > newWebElem <- remDr %>% findElement("name", "funkyname")
##D #
##D # Calling  findElement  - Try no:  1  of  3
##D #
##D # Calling  findElement  - Try no:  2  of  3
##D 
##D newWebElem %>% getElementAttribute("name")
##D 
##D # compare with a function that will fail (no element present)
##D remDr %>% findElement("id", "i am not here", retry = list(noTry = 5, delay = 10))
##D remDr %>% findElement("id", "i am not here", retry = FALSE)
## End(Not run)



