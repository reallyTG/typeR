library(shiny.router)


### Name: parse_url_path
### Title: Parse url and build GET parameters list
### Aliases: parse_url_path

### ** Examples

parse_url_path("?a=1&b=foo")
parse_url_path("?a=1&b[1]=foo&b[2]=bar/#!/")
parse_url_path("?a=1&b[1]=foo&b[2]=bar/#!/other_page")
parse_url_path("www.foo.bar/#!/other_page")
parse_url_path("www.foo.bar?a=1&b[1]=foo&b[2]=bar/#!/other")



