library(analogsea)


### Name: droplet_do_actions
### Title: Perform actions on one or more droplets associated with a tag
### Aliases: droplet_do_actions

### ** Examples

## Not run: 
##D tag_create(name = "pluto")
##D d <- droplet_create()
##D tag_resource(name = "pluto", resource_id = d$id)
##D (x <- droplet_do_actions(name = "pluto", type = "power_off"))
##D # wait until completed, check with action(xx$actions[[1]]$id)
##D droplet_do_actions(name = "pluto", type = "power_on")
## End(Not run)



