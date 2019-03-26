library(flacco)


### Name: plotCellMapping
### Title: Plot Cell Mapping
### Aliases: plotCellMapping

### ** Examples

# (1) Define a function:
library(smoof)
f = makeHosakiFunction()

# (2) Create a feature object:
X = cbind(
  x1 = runif(n = 100, min = -32, max = 32),
  x2 = runif(n = 100, min = 0, max = 10)
)
y = apply(X, 1, f)
feat.object = createFeatureObject(X = X, y = y, blocks = c(4, 6))

# (3) Plot the cell mapping:
plotCellMapping(feat.object)



