library(quarrint)


### Name: compute.ann
### Title: Neural Network-based Interaction Index for a Quarry
### Aliases: compute.ann compute.ann.default compute.ann.quarry
###   ann.interactions
### Keywords: neural

### ** Examples

# creating a quarry
q <- quarry(geological.context = 2, hydrogeological.context = 4,
            piezometric.context = 1, quarry.position = 4,
            production.catchment = 4, quality.catchment = 3)

# computing the interaction index using the default neural network
inter.idx <- compute.ann(q)



