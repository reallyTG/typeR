library(ruta)


### Name: new_network
### Title: Sequential network constructor
### Aliases: new_network

### ** Examples

my_network <- new_network(
  new_layer("input", 784, "linear"),
  new_layer("dense",  32, "tanh"),
  new_layer("dense", 784, "sigmoid")
)

# Instead, consider using
my_network <- input() + dense(32, "tanh") + output("sigmoid")



