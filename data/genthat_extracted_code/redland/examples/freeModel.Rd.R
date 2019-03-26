library(redland)


### Name: freeModel
### Title: Free memory used by a librdf model.
### Aliases: freeModel freeModel,Model-method

### ** Examples

world <- new("World")
storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
model <- new("Model", world, storage, options="")
# At this point, some operations would be performed with the model.
# See '?redland' for a complete example.
# When the Model object is no longer needed, the resources it has allocated can be freed.
freeModel(model)
rm(model)



