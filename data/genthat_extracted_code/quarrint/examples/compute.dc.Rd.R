library(quarrint)


### Name: compute.dc
### Title: Discrete Choice Model-based Interaction Index for a Quarry
### Aliases: compute.dc compute.dc.default compute.dc.quarry
### Keywords: models neural

### ** Examples

# creating a quarry
q <- quarry(geological.context = 2, hydrogeological.context = 4,
            piezometric.context = 1, quarry.position = 4,
            production.catchment = 4, quality.catchment = 3)

# computing the interaction index
inter.idx <- compute.dc(q)



