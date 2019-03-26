library(flacco)


### Name: plotBarrierTree2D
### Title: Plot Barrier Tree in 2D
### Aliases: plotBarrierTree2D

### ** Examples

# create a feature object
X = createInitialSample(n.obs = 900, dim = 2)
f = smoof::makeAckleyFunction(dimensions = 2)
y = apply(X, 1, f)
feat.object = createFeatureObject(X = X, y = y, fun = f, blocks = c(4, 6))

# plot the corresponing barrier tree
plotBarrierTree2D(feat.object)



