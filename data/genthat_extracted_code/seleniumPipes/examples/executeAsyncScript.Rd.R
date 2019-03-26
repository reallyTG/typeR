library(seleniumPipes)


### Name: executeAsyncScript
### Title: Execute JavaScript asynchronously on browser.
### Aliases: executeAsyncScript

### ** Examples

## Not run: 
##D remDr <- remoteDr()
##D # Get the page source
##D remDr %>% go("https://www.google.com/ncr") %>%
##D   getPageSource
##D 
##D remDr %>% getTitle()
##D webElem <- remDr %>% findElement("css", "img#hplogo")
##D # check if the logo is hidden
##D remDr %>% executeScript("return document.getElementById('hplogo').hidden;", args = list())
##D # [1] FALSE
##D # hide the logo
##D remDr %>% executeScript("document.getElementById('hplogo').hidden = true;", args = list())
##D # Make the logo visible this time passing a web Element as an argument
##D remDr %>% executeScript(script = "return arguments[0].hidden = false;", args = list(webElem))
##D 
##D # Pass arguments
##D remDr %>% executeScript(script = "return argument[1] + argument[2];"
##D                         , args = list(1, 2))
##D 
##D # Return a web Element
##D remDr %>% executeScript(script = "return document.getElementById('hplogo');", args = list())
##D # ElementId: 0
##D # Remote Driver:
##D #   Remote Ip Address: http://localhost:4444/wd/hub
##D # Remote sessionId: 9a83672a-d72b-4873-aa7d-96f7f1f80fa0
##D 
##D # Return a web Element in a more complex object
##D script <- "var test ={num:1, str:'a', el:document.getElementById('hplogo')};return test;"
##D remDr %>% executeScript(script = script
##D                         , args = list())
##D # $str
##D # [1] "a"
##D #
##D # $num
##D # [1] 1
##D #
##D # $el
##D # ElementId: 0
##D # Remote Driver:
##D #   Remote Ip Address: http://localhost:4444/wd/hub
##D # Remote sessionId: 9a83672a-d72b-4873-aa7d-96f7f1f80fa0
##D 
##D # Run with replace = FALSE
##D remDr %>% executeScript(script = script
##D                         , args = list(), replace = FALSE)
##D # $str
##D # [1] "a"
##D #
##D # $num
##D # [1] 1
##D #
##D # $el
##D # $el$ELEMENT
##D # [1] "0"
##D 
##D remDr %>% setTimeout("script")
##D 
##D asScript <- "cb = arguments[0];setTimeout(function(){cb('DONE');},5000); "
##D system.time(test1 <- remDr %>% executeAsyncScript(asScript, args = list()))
##D sScript <- "setTimeout(function(){},5000); return 'DONE';"
##D system.time(test2 <- remDr %>% executeScript(sScript, args = list()))
##D 
##D 
##D remDr %>% deleteSession()
##D 
## End(Not run)



