library(rvest)


### Name: set_values
### Title: Set values in a form.
### Aliases: set_values

### ** Examples

search <- html_form(read_html("http://www.google.com"))[[1]]
set_values(search, q = "My little pony")
set_values(search, hl = "fr")
## Not run: set_values(search, btnI = "blah")



