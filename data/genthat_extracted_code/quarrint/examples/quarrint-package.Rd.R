library(quarrint)


### Name: quarrint-package
### Title: Interaction Prediction Between Groundwater and Quarry Extension
###   Using Discrete Choice Models and Artificial Neural Networks
### Aliases: quarrint-package quarrint
### Keywords: package neural models

### ** Examples

# creating a quarry
q <- quarry(geological.context = 2, hydrogeological.context = 4,
            piezometric.context = 1, quarry.position = 4,
            production.catchment = 4, quality.catchment = 3)
print(q)
# computing the interaction index
inter.idx <- compute.interaction(q)
print(inter.idx)



