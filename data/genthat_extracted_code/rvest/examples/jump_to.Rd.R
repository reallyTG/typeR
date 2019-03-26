library(rvest)


### Name: jump_to
### Title: Navigate to a new url.
### Aliases: follow_link jump_to

### ** Examples

## No test: 
s <- html_session("http://hadley.nz")
s <- s %>% follow_link("github")
s <- s %>% back()
s %>% follow_link("readr")
## End(No test)



