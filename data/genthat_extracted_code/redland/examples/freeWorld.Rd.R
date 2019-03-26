library(redland)


### Name: freeWorld
### Title: Free memory used by a librdf world object
### Aliases: freeWorld freeWorld,World-method

### ** Examples

world <- new("World")
# At this point we would perform some operations using the world object.
# When the world object is no longer needed, we can free the resources it has allocated.
result <- freeWorld(world)
rm(world)



