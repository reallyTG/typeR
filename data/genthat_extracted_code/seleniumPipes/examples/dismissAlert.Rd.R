library(seleniumPipes)


### Name: dismissAlert
### Title: Dismiss Alert
### Aliases: dismissAlert

### ** Examples

## Not run: 
##D   remDr <- remoteDr()
##D   remDr %>% go("https://www.google.com/ncr") %>%
##D     getTitle()
##D   sScript <- "setTimeout(function(){alert('HELLO')},1000); return 'DONE';"
##D   remDr %>% executeScript(sScript, args = list())
##D   remDr %>% dismissAlert()
##D 
##D   sScript <- "setTimeout(function(){confirm('Press a button')},1000); return 'DONE';"
##D   remDr %>% executeScript(sScript, args = list())
##D   remDr %>% acceptAlert()
##D 
##D   sScript <- "setTimeout(function(){confirm('Press a button')},1000); return 'DONE';"
##D   remDr %>% executeScript(sScript, args = list())
##D   remDr %>% getAlertText()
##D   remDr %>% dismissAlert()
##D 
##D 
##D   sScript <- "setTimeout(function(){prompt('Please enter your name', '')},1000); return 'DONE';"
##D   remDr %>% executeScript(sScript, args = list())
##D   remDr %>% getAlertText()
##D   remDr %>% sendAlertText("Buck Rogers?")
##D 
##D   remDr %>% deleteSession()
##D 
## End(Not run)



