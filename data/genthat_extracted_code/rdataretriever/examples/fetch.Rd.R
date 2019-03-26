library(rdataretriever)


### Name: fetch
### Title: Fetch a dataset via the Data Retriever
### Aliases: fetch

### ** Examples

## No test: 
## fetch the portal Database
portal = rdataretriever::fetch('portal')
class(portal)
names(portal)
## preview the data in the portal species datafile
head(portal$species)
## End(No test)



