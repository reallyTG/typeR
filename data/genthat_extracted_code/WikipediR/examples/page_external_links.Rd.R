library(WikipediR)


### Name: page_external_links
### Title: Retrieve a page's links
### Aliases: page_external_links

### ** Examples

#Links
external_links <- page_external_links("en","wikipedia", page = "Aaron Halfaker")

#Protocol-specific links
external_http_links <- page_external_links("en","wikipedia",
                                          page = "Aaron Halfaker", protocol = "http")



