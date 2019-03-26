library(quarrint)


### Name: compute.interaction
### Title: Compute the Interaction Index for a Quarry
### Aliases: compute.interaction compute.interaction.default
###   compute.interaction.quarry print.interaction.index interaction.index
### Keywords: models neural

### ** Examples

# creating a quarry
q <- quarry(geological.context = 2, hydrogeological.context = 4,
            piezometric.context = 1, quarry.position = 4,
            production.catchment = 4, quality.catchment = 3)

# computing the interaction index
inter.idx <- compute.interaction(q)
print(inter.idx)



