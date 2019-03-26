library(analogsea)


### Name: as.volume
### Title: Block storage operations
### Aliases: as.volume volumes volume volume_create volume_snapshot_create
###   volume_snapshots volume_delete

### ** Examples

## Not run: 
##D # list volumes
##D volumes()
##D 
##D # create a volume
##D vol1 <- volume_create('testing', 5)
##D vol2 <- volume_create('foobar', 6)
##D 
##D # create snapshot of a volume
##D xx <- volume_snapshot_create(vol2, "howdy")
##D 
##D # list snaphots for a volume
##D volume_snapshots(xx)
##D 
##D # list volumes again
##D res <- volumes()
##D 
##D # get a single volume
##D ## a whole volume class object
##D volume(res$testing)
##D ## by id
##D volume(res[[1]]$id)
##D ## by name
##D volume(res[[1]]$name)
##D 
##D # delete a volume
##D ## a whole volume class object
##D volume_delete(res$testing)
##D ## by id
##D volume_delete(res[[1]]$id)
##D ## by name
##D volume_delete(res[[1]]$name)
##D 
##D # delete many volumes
##D lapply(volumes(), volume_delete)
## End(Not run)



