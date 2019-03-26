library(ruta)


### Name: new_layer
### Title: Layer wrapper constructor
### Aliases: new_layer

### ** Examples

my_layer <- new_layer("dense", 30, "tanh")

# Equivalent:
my_layer <- dense(30, "tanh")[[1]]



