library(NNS)


### Name: NNS.part
### Title: NNS Partition Map
### Aliases: NNS.part
### Keywords: cluster partitioning,

### ** Examples

set.seed(123)
x <- rnorm(100) ; y <- rnorm(100)
NNS.part(x, y)

## Data.table of observations and partitions
NNS.part(x, y, order = 1)$dt

## Regression points
NNS.part(x, y, order = 1)$regression.points

## Voronoi style plot
NNS.part(x, y, Voronoi = TRUE)

## Examine final counts by quadrant
DT = NNS.part(x, y)$dt
DT[ , counts := .N, by = quadrant]
DT



