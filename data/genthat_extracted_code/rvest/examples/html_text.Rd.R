library(rvest)


### Name: html_text
### Title: Extract attributes, text and tag name from html.
### Aliases: html_attr html_attrs html_children html_name html_text

### ** Examples

movie <- read_html("http://www.imdb.com/title/tt1490017/")
cast <- html_nodes(movie, "#titleCast span.itemprop")
html_text(cast)
html_name(cast)
html_attrs(cast)
html_attr(cast, "class")



