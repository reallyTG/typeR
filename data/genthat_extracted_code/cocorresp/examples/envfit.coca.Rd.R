library(cocorresp)


### Name: envfit.coca
### Title: Fit an environmental vector or factor to a Co-CA ordination
### Aliases: envfit.coca
### Keywords: multivariate htest

### ** Examples

## symmetric CoCA
data(beetles)
data(plants)

## log transform the bettle data
beetles <- log(beetles + 1)

## fit the model
bp.sym <- coca(beetles ~ ., data = plants, method = "symmetric")

## load the environmental data
data(verges)

## fit vectors for the environmental data
sol <- envfit(bp.sym, verges, which = "response")
sol

## plot the response matrix and the fitted vectors
plot(bp.sym, which = "response")
plot(sol)



