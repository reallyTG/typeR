library(simone)


### Name: coNetwork
### Title: Random perturbations of a reference network
### Aliases: coNetwork
### Keywords: graphs datagen

### ** Examples

## ancestor and child network generation
ancestor <- rNetwork(p = 20, pi = 20, name = "ancestor")
child    <- coNetwork(ancestor, delta = 1, name = "child")

# network comparison
plot(ancestor, child)



