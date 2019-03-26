library(cheddar)


### Name: LoadCollection
### Title: Loading and saving CommunityCollection objects
### Aliases: LoadCollection SaveCollection
### Keywords: utilities

### ** Examples

data(pHWebs)
temp.path <- tempfile()
SaveCollection(pHWebs, temp.path)
pHWebs.loaded <- LoadCollection(temp.path)
pHWebs.loaded <- OrderCollection(pHWebs.loaded, 'pH')
unlink(temp.path, recursive=TRUE)
identical(pHWebs, pHWebs.loaded)    # TRUE



