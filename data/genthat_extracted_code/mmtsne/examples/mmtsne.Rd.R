library(mmtsne)


### Name: mmtsne
### Title: Multiple maps t-SNE
### Aliases: mmtsne

### ** Examples

# Load the iris dataset
data("iris")

# Estimate a mmtsne model with 2 maps, 2 dimensions each
model <- mmtsne(iris[,1:4], no_maps=2, max_iter=100)

# Plot the results side-by-side for inspection
# Points scaled by map proportion weights plus constant factor
par(mfrow=c(1,2))
plot(model$Y[,,1], col=iris$Species, cex=model$proportions[,1] + .2)
plot(model$Y[,,2], col=iris$Species, cex=model$proportions[,2] + .2)
par(mfrow=c(1,1))




