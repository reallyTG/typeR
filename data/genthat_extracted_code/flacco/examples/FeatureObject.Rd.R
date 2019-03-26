library(flacco)


### Name: FeatureObject
### Title: Create a Feature Object
### Aliases: FeatureObject createFeatureObject

### ** Examples

# (1a) create a feature object using X and y:
X = createInitialSample(n.obs = 500, dim = 3,
  control = list(init_sample.lower = -10, init_sample.upper = 10))
y = apply(X, 1, function(x) sum(x^2))
feat.object1 = createFeatureObject(X = X, y = y, 
  lower = -10, upper = 10, blocks = c(5, 10, 4))

# (1b) create a feature object using X and fun:
feat.object2 = createFeatureObject(X = X, 
  fun = function(x) sum(sin(x) * x^2),
  lower = -10, upper = 10, blocks = c(5, 10, 4))

# (1c) create a feature object using a data.frame:
feat.object3 = createFeatureObject(iris[,-5], blocks = 5, 
  objective = "Petal.Length")

# (2) have a look at the feature objects:
feat.object1
feat.object2
feat.object3

# (3) now, one could calculate features
calculateFeatureSet(feat.object1, "ela_meta")
calculateFeatureSet(feat.object2, "cm_grad")
library(plyr)
calculateFeatureSet(feat.object3, "cm_angle", control = list(cm_angle.show_warnings = FALSE))




