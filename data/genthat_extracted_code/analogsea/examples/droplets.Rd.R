library(analogsea)


### Name: droplets
### Title: List all available droplets.
### Aliases: droplets

### ** Examples

## Not run: 
##D droplets()
##D droplets(per_page = 2)
##D droplets(per_page = 2, page = 2)
##D 
##D # list droplets by tag
##D tag_create(name = "stuffthings")
##D d <- droplet_create()
##D tag_resource(name = "stuffthings", resource_id = d$id,
##D   resource_type = "droplet")
##D droplets(tag = "stuffthings")
## End(Not run)



