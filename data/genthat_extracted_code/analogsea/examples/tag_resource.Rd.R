library(analogsea)


### Name: tag_resource
### Title: Tag a resource
### Aliases: tag_resource

### ** Examples

## Not run: 
##D d <- droplet_create()
##D tag_resource(name = "stuffthings", resource_id = d$id,
##D   resource_type = "droplet")
##D tag_resource("stuffthings", resources = list(list(resource_id = d$id,
##D   resource_type = "droplet")))
## End(Not run)



