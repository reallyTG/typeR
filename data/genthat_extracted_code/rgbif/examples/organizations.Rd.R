library(rgbif)


### Name: organizations
### Title: Organizations metadata.
### Aliases: organizations

### ** Examples

## Not run: 
##D organizations(limit=5)
##D organizations(query="france", limit=5)
##D organizations(uuid="4b4b2111-ee51-45f5-bf5e-f535f4a1c9dc")
##D organizations(data='contact', uuid="4b4b2111-ee51-45f5-bf5e-f535f4a1c9dc")
##D organizations(data='pending')
##D organizations(data=c('contact','endpoint'),
##D   uuid="4b4b2111-ee51-45f5-bf5e-f535f4a1c9dc")
##D 
##D # Pass on curl options
##D organizations(query="spain", curlopts = list(verbose=TRUE))
## End(Not run)



