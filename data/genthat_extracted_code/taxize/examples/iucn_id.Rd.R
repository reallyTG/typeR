library(taxize)


### Name: iucn_id
### Title: Get an ID for a IUCN listed taxon
### Aliases: iucn_id

### ** Examples

## Not run: 
##D iucn_id("Branta canadensis")
##D iucn_id("Branta bernicla")
##D iucn_id("Panthera uncia")
##D iucn_id("Lynx lynx")
##D 
##D # many names
##D iucn_id(c("Panthera uncia", "Lynx lynx"))
##D 
##D # many names, some not found
##D iucn_id(c("Panthera uncia", "Lynx lynx", "foo bar", "hello world"))
##D 
##D # a name not found
##D iucn_id("Foo bar")
## End(Not run)



