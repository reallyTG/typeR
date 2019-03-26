library(flacco)


### Name: calculateFeatureSet
### Title: Calculate Landscape Features
### Aliases: calculateFeatureSet calculateFeatures

### ** Examples

# (1) create a feature object:
X = t(replicate(n = 2000, expr = runif(n = 5, min = -10, max = 10)))
## Not run: feat.object = createFeatureObject(X = X, fun = function(x) sum(x^2))

# (2) compute all non-cellmapping features
ctrl = list(allow_cellmapping = FALSE)
## Not run: features = calculateFeatures(feat.object, control = ctrl)

# (3) in order to allow the computation of the cell mapping features, one
# has to provide a feature object that has knowledge about the number of
# cells per dimension:
f = function(x) sum(x^2)
feat.object = createFeatureObject(X = X, fun = f, blocks = 3)
## Not run: features = calculateFeatures(feat.object)

# (4) if you want to compute a specific feature set, you can use
# calculateFeatureSet:
features.angle = calculateFeatureSet(feat.object, "cm_angle")

# (5) as noted in the details, it might be useful to compute the levelset
# features parallelized:
## Not run: 
##D library(parallelMap)
##D library(parallel)
##D n.cores = detectCores()
##D parallelStart(mode = "socket", cpus = n.cores,
##D   logging = FALSE, show.info = FALSE)
##D system.time((levelset.par = calculateFeatureSet(feat.object, "ela_level")))
##D parallelStop()
##D system.time((levelset.seq = calculateFeatureSet(feat.object, "ela_level")))
## End(Not run)




