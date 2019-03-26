library(stabm)


### Name: stabilityIntersectionMean
### Title: Stability Measure Adjusted Intersection Mean
### Aliases: stabilityIntersectionMean

### ** Examples

feats = list(1:3, 1:4, 1:5)
mat = 0.92 ^ abs(outer(1:10, 1:10, "-"))
stabilityIntersectionMean(features = feats, sim.mat = mat, N = 1000)



