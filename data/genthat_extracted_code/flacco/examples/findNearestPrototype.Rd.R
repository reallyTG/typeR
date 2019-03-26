library(flacco)


### Name: findNearestPrototype
### Title: Find Nearest Prototype
### Aliases: findNearestPrototype

### ** Examples

# (1) create the initial sample and feature object:
X = createInitialSample(n.obs = 1000, dim = 2,
  control = list(init_sample.lower = -10, init_sample.upper = 10))
feat.object = createFeatureObject(X = X, 
  fun = function(x) sum(x^2), blocks = 10)

# (2) find the nearest prototypes of all cells:
findNearestPrototype(feat.object)



