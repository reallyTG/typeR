library(rvest)


### Name: html
### Title: Parse an HTML page.
### Aliases: html read_xml.response read_xml.session
### Keywords: deprecated

### ** Examples

# From a url:
google <- read_html("http://google.com", encoding = "ISO-8859-1")
google %>% xml_structure()
google %>% html_nodes("div")

# From a string: (minimal html 5 document)
# http://www.brucelawson.co.uk/2010/a-minimal-html5-document/
minimal <- read_html("<!doctype html>
  <meta charset=utf-8>
 <title>blah</title>
 <p>I'm the content")
minimal
minimal %>% xml_structure()

# From an httr request
google2 <- read_html(httr::GET("http://google.com"))



