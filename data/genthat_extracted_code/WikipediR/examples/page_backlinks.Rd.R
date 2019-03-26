library(WikipediR)


### Name: page_backlinks
### Title: Retrieve a page's backlinks
### Aliases: page_backlinks

### ** Examples

#Backlink
all_bls <- page_backlinks("en","wikipedia", page = "Aaron Halfaker")

#Namespace-specific backlinks
mainspace_bls <- page_backlinks("en","wikipedia", page = "Aaron Halfaker", namespaces = 0)



