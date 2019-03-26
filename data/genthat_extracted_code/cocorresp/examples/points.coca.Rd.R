library(cocorresp)


### Name: points.coca
### Title: Add points to a Co-CA plot
### Aliases: points.coca
### Keywords: methods

### ** Examples

## symmetric CoCA
data(beetles)
data(plants)
     
## log transform the bettle data
beetles <- log(beetles + 1)
     
## fit the model
bp.sym <- coca(beetles ~ ., data = plants, method = "symmetric")

## draw a biplot of the response
plot(bp.sym, type = "none")
points(bp.sym, display = "sites", col = "blue", pch = 16)
points(bp.sym, display = "species", col = "red", pch = 3, cex = 0.8)



