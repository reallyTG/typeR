library(taxize)


### Name: get_iucn
### Title: Get a IUCN Redlist taxon
### Aliases: get_iucn as.iucn as.iucn.iucn as.iucn.character as.iucn.list
###   as.iucn.numeric as.iucn.data.frame as.data.frame.iucn

### ** Examples

## Not run: 
##D get_iucn(x = "Branta canadensis")
##D get_iucn(x = "Branta bernicla")
##D get_iucn(x = "Panthera uncia")
##D 
##D # as coercion
##D as.iucn(22732)
##D as.iucn("22732")
##D (res <- as.iucn(c(22679946, 22732, 22679935)))
##D data.frame(res)
##D as.iucn(data.frame(res))
## End(Not run)



