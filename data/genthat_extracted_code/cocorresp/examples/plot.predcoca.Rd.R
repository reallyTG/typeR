library(cocorresp)


### Name: plot.predcoca
### Title: Biplots for predictive co-correspondence analysis
### Aliases: plot.predcoca
### Keywords: hplot

### ** Examples

## predictive CoCA
data(beetles)
data(plants)

## log transform the bettle data
beetles <- log(beetles + 1)

## predictive CoCA using SIMPLS and formula interface
bp.pred <- coca(beetles ~ ., data = plants)

## draw the biplot for the response
plot(bp.pred)

## plot of both
layout(matrix(1:2, ncol = 2))
plot(bp.pred, which = "response", main = "Beetles")
plot(bp.pred, which = "predictor", main = "Plants")
layout(1)



