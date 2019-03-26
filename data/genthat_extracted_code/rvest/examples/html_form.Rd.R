library(rvest)


### Name: html_form
### Title: Parse forms in a page.
### Aliases: html_form

### ** Examples

## No test: 
html_form(read_html("https://hadley.wufoo.com/forms/libraryrequire-quiz/"))
html_form(read_html("https://hadley.wufoo.com/forms/r-journal-submission/"))

box_office <- read_html("http://www.boxofficemojo.com/movies/?id=ateam.htm")
box_office %>% html_node("form") %>% html_form()
## End(No test)



