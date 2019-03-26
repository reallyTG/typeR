library(redland)


### Name: freeStorage
### Title: Free memory used by a librdf storage object
### Aliases: freeStorage freeStorage,Storage-method

### ** Examples

world <- new("World")
storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
# At this point we would perform some operations using the storage object.
# See '?redland' for a complete example.
# When the Storage object is no longer needed, the resources it had allocated can be freed.
status <- freeStorage(storage)
rm(storage)



