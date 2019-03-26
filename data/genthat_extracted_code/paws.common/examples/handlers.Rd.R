library(paws.common)


### Name: handlers
### Title: Set or add to handler lists
### Aliases: handlers handlers_set handlers_add_back handlers_add_front
### Keywords: internal

### ** Examples

# Replace a handler list with a new handler list.
## No test: 
handlers$build <- handlers_set(restxml_build)
## End(No test)

# Add a new handler onto the end of an existing handler list.
## No test: 
handlers$build <- handlers_add_back(handlers$build, restxml_build)
## End(No test)

# Add a new handler at the beginning of an existing handler list.
## No test: 
handlers$build <- handlers_add_front(handlers$build, restxml_build)
## End(No test)




