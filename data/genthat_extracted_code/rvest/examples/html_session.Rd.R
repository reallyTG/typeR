library(rvest)


### Name: html_session
### Title: Simulate a session in an html browser.
### Aliases: html_session is.session

### ** Examples

# http://stackoverflow.com/questions/15853204

s <- html_session("http://hadley.nz")
s %>% jump_to("hadley-wickham.jpg") %>% jump_to("/") %>% session_history()
s %>% jump_to("hadley-wickham.jpg") %>% back() %>% session_history()
## No test: 
s %>% follow_link(css = "p a")
## End(No test)



