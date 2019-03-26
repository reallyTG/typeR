library(dataverse)


### Name: dataverse_search
### Title: Search Dataverse server
### Aliases: dataverse_search

### ** Examples

## Not run: 
##D # simple string search
##D dataverse_search("Gary King")
##D 
##D # search using named arguments
##D dataverse_search(c(author = "Gary King", title = "Ecological Inference"))
##D dataverse_search(author = "Gary King", title = "Ecological Inference")
##D 
##D # search only for datasets
##D dataverse_search(author = "Gary King", type = "dataset")
## End(Not run)



