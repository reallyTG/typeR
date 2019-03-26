library(WikipediaR)


### Name: links
### Title: lists links on a Wikipedia page
### Aliases: links

### ** Examples

## Not run: 
##D # a simple example
##D links("Louis Pasteur") # default domain : en
##D 
##D # with a redirected page
##D links.Obama <- links(page ="Obama")
##D links.Obama
##D # warning message
##D 
##D # a simple example with page specified by its page ID number
##D links(page = 976, domain = "fr" )
##D 
##D # with a page that not exist (at the moment of the redaction of this help page)
##D links("zzzzz") 
## End(Not run)



