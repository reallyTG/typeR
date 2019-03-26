library(inca)


### Name: adjWeights
### Title: Function for Weights Adjustments
### Aliases: adjWeights

### ** Examples

library(inca)
w <- rnorm(150, 0, 2)
aw <- adjWeights(w, runif(150, -3, -1), runif(150, 1, 3))
hist(aw, main = "Adjusted weights")




