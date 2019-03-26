library(quarrint)


### Name: train.ann
### Title: Training an Artificial Neural Network for Interaction
###   Prediction.
### Aliases: train.ann
### Keywords: neural

### ** Examples

## Not run: 
##D # training a neural network using the attribues H and T as predictors,
##D # with 2 hidden layers of 2 nodes each and computing 2 replications
##D r.ann <- train.ann(var = c("H", "T", "L", "Z"), hidden = c(2, 2), rep = 2)
##D 
##D # using the ann to compute the interaction
##D q <- quarry(geological.context = 2, hydrogeological.context = 4,
##D             piezometric.context = 1, quarry.position = 4,
##D             production.catchment = 4, quality.catchment = 3)
##D compute.interaction(q, method="ann", ann = r.ann$ann)
## End(Not run)



