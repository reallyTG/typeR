library(flacco)


### Name: plotBarrierTree3D
### Title: Plot Barrier Tree in 3D
### Aliases: plotBarrierTree3D

### ** Examples

# create a feature object
X = createInitialSample(n.obs = 900, dim = 2)
f = smoof::makeAckleyFunction(dimensions = 2)
y = apply(X, 1, f)
feat.object = createFeatureObject(X = X, y = y, fun = f, blocks = c(4, 6))

# plot the corresponing barrier tree
plotBarrierTree3D(feat.object)



