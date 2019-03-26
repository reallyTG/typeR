library(analogsea)


### Name: droplets_create
### Title: Create many new droplets.
### Aliases: droplets_create

### ** Examples

## Not run: 
##D # if no names given, creates two droplets with random names
##D droplets_create()
##D 
##D # give names
##D droplets_create(names = c('drop1', 'drop2'))
##D droplets_create(names = c('drop3', 'drop4'))
##D 
##D # add tags
##D (d <- droplets_create(tags = 'mystuff'))
##D invisible(lapply(d, summary))
## End(Not run)



