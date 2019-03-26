library(seleniumPipes)


### Name: addCookie
### Title: Add a specific cookie.
### Aliases: addCookie

### ** Examples

## Not run: 
##D # assume a server is running at default location
##D remDr <- remoteDr()
##D remDr %>% go("https://www.google.com/ncr") %>%
##D   getTitle()
##D # get the cookies
##D remDr %>% getCookie()
##D # get a named cookie
##D remDr %>% getCookie("NID")
##D # add our own cookie
##D remDr %>% addCookie(name = "myCookie", value = "12")
##D # check its value
##D remDr %>% getCookie("myCookie")
##D # delete our cookie
##D remDr %>% deleteCookie("myCookie")
##D # check its deleted
##D remDr %>% getCookie("myCookie")
##D 
##D # delete all cookies
##D remDr %>% getCookie()
##D remDr %>% deleteAllCookies() %>%
##D   getCookie()
##D 
##D remDr %>% deleteSession()
## End(Not run)



