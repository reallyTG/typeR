library(analogsea)


### Name: volume_attach
### Title: Attach a volume to a droplet
### Aliases: volume_attach volume_detach volume_resize volume_action
###   volume_actions

### ** Examples

## Not run: 
##D # resize a volume
##D ## create a volume
##D (vol1 <- volume_create('foobar', 5))
##D ## resize it
##D volume_resize(vol1, 6)
##D volume(vol1)
##D 
##D # attach a volume to a droplet
##D ## create a droplet
##D (d <- droplet_create(region = "nyc1"))
##D ## attach volume to droplet
##D volume_attach(vol1, d)
##D ## refresh droplet info, see volumes slot
##D droplet(d$id)
##D 
##D # detach a volume from a droplet
##D (act <- volume_detach(vol1, d))
##D ## refresh droplet info, see volumes slot
##D droplet(d$id)
##D 
##D # list an action
##D volume_action(vol1, 154689758)
##D 
##D # list all volume actions
##D volume_actions(volumes()[[1]])
## End(Not run)



