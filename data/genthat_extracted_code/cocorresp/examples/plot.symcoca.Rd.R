library(cocorresp)


### Name: plot.symcoca
### Title: Biplots for symmetric co-correspondence analysis
### Aliases: plot.symcoca
### Keywords: hplot methods

### ** Examples

## symmetric CoCA
data(beetles)
data(plants)

## log transform the bettle data
beetles <- log(beetles + 1)

## fit the model
bp.sym <- coca(beetles ~ ., data = plants, method = "symmetric")

## draw a biplot of the response
plot(bp.sym)

## plot of both
layout(matrix(1:2, ncol = 2))
plot(bp.sym, which = "response", main = "Beetles")
plot(bp.sym, which = "predictor", main = "Plants")
layout(1)



