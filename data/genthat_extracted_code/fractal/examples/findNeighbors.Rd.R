library(fractal)


### Name: findNeighbors
### Title: Nearest neighbor search in a multidimensional space
### Aliases: findNeighbors
### Keywords: distribution

### ** Examples

## Calculate the 10 nearest neighbors for each 
## point of 3-dimensional delayed coordinate 
## embedding of the beamchaos data. Exclude 
## self-neighbors from the output. 
embedding <- embedSeries( beamchaos, dim = 3, tlag = 10 )
nn <- findNeighbors( embedding, n.neighbor=10, olag=1 )

## Using the same data, find only those neighbors 
## within a distance 0.1 of the original points 
## based on an L-infinity metric 
nn.dist <- findNeighbors( embedding, max.distance=0.1,
metric=Inf, olag=1 )



