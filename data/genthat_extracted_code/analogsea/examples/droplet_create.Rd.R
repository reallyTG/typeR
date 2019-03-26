library(analogsea)


### Name: droplet_create
### Title: Create a new droplet.
### Aliases: droplet_create

### ** Examples

## Not run: 
##D # by default we give your droplet a name
##D droplet_create()
##D 
##D # you can set your own droplet name
##D droplet_create('droppinit')
##D 
##D # set name, size, image, and region
##D droplet_create(name="newdrop", size = '512mb', image = 'ubuntu-14-04-x64',
##D   region = 'sfo1')
##D 
##D # use an ssh key
##D droplet_create(ssh_keys=89103)
##D 
##D # add tags
##D (d <- droplet_create(tags = c('venus', 'mars')))
##D summary(d)
## End(Not run)



