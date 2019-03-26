library(stabm)


### Name: stabilityZucknick
### Title: Stability Measure Zucknick
### Aliases: stabilityZucknick

### ** Examples

feats = list(1:3, 1:4, 1:5)
mat = 0.92 ^ abs(outer(1:10, 1:10, "-"))
stabilityZucknick(features = feats, sim.mat = mat)



