library(redland)


### Name: Model-class
### Title: A Redland Model object
### Aliases: Model-class Model
### Keywords: classes

### ** Examples

world <- new("World")
storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
model <- new("Model", world, storage, options="")



