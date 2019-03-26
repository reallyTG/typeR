library(multinet)


### Name: Transformation
### Title: Functions to merge multiple layers into one: flattening
### Aliases: Transformation flatten.ml

### ** Examples

net <- ml.aucs()
# A new layer is added to the network, with a flattening of all the other layers
flatten.ml(net, layers=layers.ml(net))



