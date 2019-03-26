library(cocorresp)


### Name: screeplot.symcoca
### Title: Screeplot for symmetric co-correspondence analysis
### Aliases: screeplot.symcoca
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
screeplot(bp.sym)




