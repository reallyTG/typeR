library(analogsea)


### Name: as.snapshot
### Title: Snapshot operations
### Aliases: as.snapshot snapshots snapshot snapshot_delete

### ** Examples

## Not run: 
##D # list all snapshots
##D (res <- snapshots())
##D 
##D # list droplet snapshots
##D snapshots(type = "droplet")
##D 
##D # list volume snapshots
##D snapshots(type = "volume")
##D 
##D # get a single snapshot
##D snapshot(res[[1]]$id)
##D 
##D # delete a snapshot
##D ## a whole snapshot class object
##D snapshot_delete(res[[2]])
##D ## by id
##D snapshot_delete(res[[2]]$id)
##D ## by name
##D snapshot_delete(res[[2]]$name)
##D 
##D # delete many snapshots
##D lapply(snapshots(), snapshot_delete)
## End(Not run)



