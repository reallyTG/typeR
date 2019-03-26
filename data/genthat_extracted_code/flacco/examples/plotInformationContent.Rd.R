library(flacco)


### Name: plotInformationContent
### Title: Plot Information Content
### Aliases: plotInformationContent

### ** Examples

# (1) create a feature object:
X = t(replicate(n = 2000, expr = runif(n = 5, min = -10, max = 10)))
feat.object = createFeatureObject(X = X, fun = function(x) sum(x^2))

# (2) plot its information content features:
plotInformationContent(feat.object)



