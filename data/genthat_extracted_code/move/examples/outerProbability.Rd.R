library(move)


### Name: outerProbability
### Title: Calculates the probabilities at the edges of a raster
### Aliases: outerProbability outerProbability,RasterLayer-method
###   outerProbability,DBBMMStack-method

### ** Examples

data(leroydbbmm)
#calculate the probabilities of 20% of the raster at the border from a DBBMM
outerProbability(leroydbbmm, border=.2)

#calculate the probabilities of 50% of the raster at the border from a DBBMMStack
outerProbability(leroydbbmm, border=.5)



