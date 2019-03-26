library(quarrint)


### Name: quarry
### Title: Create a Quarry Object
### Aliases: quarry print.quarry

### ** Examples

# creating a quarry for which every parameter is within the default range
q1 <- quarry(geological.context = 2, hydrogeological.context = 4,
             piezometric.context = 1, quarry.position = 4,
             production.catchment = 4, quality.catchment = 3)
print(q1, verbose = TRUE)

# creating a quarry for which the parameters are within a custom range [0, 10]
q2 <- quarry(geological.context = 8, hydrogeological.context = 4,
             piezometric.context = 0, quarry.position = 4,
             production.catchment = 6, quality.catchment = 3,
             low.bound = 0, up.bound = 10)
print(q2)



