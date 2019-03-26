library(stabm)


### Name: stabilityIntersectionGreedy
### Title: Stability Measure Adjusted Intersection Greedy
### Aliases: stabilityIntersectionGreedy

### ** Examples

feats = list(1:3, 1:4, 1:5)
mat = 0.92 ^ abs(outer(1:10, 1:10, "-"))
stabilityIntersectionGreedy(features = feats, sim.mat = mat, N = 1000)



