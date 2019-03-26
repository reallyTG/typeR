library(rgbif)


### Name: installations
### Title: Installations metadata.
### Aliases: installations

### ** Examples

## Not run: 
##D installations(limit=5)
##D installations(query="france", limit = 25)
##D installations(uuid="b77901f9-d9b0-47fa-94e0-dd96450aa2b4")
##D installations(data='contact', uuid="2e029a0c-87af-42e6-87d7-f38a50b78201")
##D installations(data='endpoint', uuid="b77901f9-d9b0-47fa-94e0-dd96450aa2b4")
##D installations(data='dataset', uuid="b77901f9-d9b0-47fa-94e0-dd96450aa2b4")
##D installations(data='deleted', limit = 25)
##D installations(data='deleted', limit=2)
##D installations(data=c('deleted','nonPublishing'), limit=2)
##D installations(identifierType='DOI', limit=2)
##D 
##D # Pass on curl options
##D installations(data='deleted', curlopts = list(verbose=TRUE))
## End(Not run)



