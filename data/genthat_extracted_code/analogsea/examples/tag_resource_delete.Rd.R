library(analogsea)


### Name: tag_resource_delete
### Title: Untag a resource
### Aliases: tag_resource_delete

### ** Examples

## Not run: 
##D d <- droplet_create()
##D tag_resource(name = "stuffthings", resource_id = d$id,
##D   resource_type = "droplet")
##D ## same as this because only allowed resource type right now is "droplet"
##D # tag_resource(name = "stuffthings", resource_id = d$id)
##D tag_resource_delete(name = "stuffthings", resource_id = d$id,
##D   resource_type = "droplet")
## End(Not run)



