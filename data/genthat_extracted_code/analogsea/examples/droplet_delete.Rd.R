library(analogsea)


### Name: droplet_delete
### Title: Delete a droplet.
### Aliases: droplet_delete

### ** Examples

## Not run: 
##D drops <- droplets()
##D drops[[1]] %>% droplet_delete()
##D drops[[2]] %>% droplet_delete()
##D droplet_create() %>% droplet_delete()
##D 
##D droplet_delete("lombard")
##D droplet_delete(12345)
##D 
##D # Delete all droplets
##D lapply(droplets(), droplet_delete)
##D 
##D # delete droplets by tag
##D ## first, create a tag, then a droplet, then tag it
##D tag_create(name = "foobar")
##D e <- droplet_create()
##D tag_resource(name = "foobar", resource_id = e$id)
##D droplets(tag = "foobar")
##D ## then delete the droplet by tag name
##D droplet_delete(tag = "foobar")
## End(Not run)



