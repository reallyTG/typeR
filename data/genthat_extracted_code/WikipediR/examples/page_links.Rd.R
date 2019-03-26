library(WikipediR)


### Name: page_links
### Title: Retrieve a page's links
### Aliases: page_links

### ** Examples

#Links
links <- page_links("en","wikipedia", page = "Aaron Halfaker")

#Namespace-specific links
mainspace_links <- page_links("en","wikipedia", page = "Aaron Halfaker", namespaces = 0)



