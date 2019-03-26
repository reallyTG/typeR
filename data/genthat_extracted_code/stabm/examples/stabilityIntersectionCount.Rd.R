library(stabm)


### Name: stabilityIntersectionCount
### Title: Stability Measure Adjusted Intersection Count
### Aliases: stabilityIntersectionCount

### ** Examples

feats = list(1:3, 1:4, 1:5)
mat = 0.92 ^ abs(outer(1:10, 1:10, "-"))
stabilityIntersectionCount(features = feats, sim.mat = mat, N = 1000)



